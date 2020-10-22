Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637AA295F02
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 14:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F3717B0;
	Thu, 22 Oct 2020 14:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F3717B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603371169;
	bh=LfmePepN4NrtYQD4AkWORMiHyAoozBMg9bfAVM689vw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iiy6mWkXNJUFSoJ6puVg8eRoMrlHe2IwYODRuSHwSWKYskyAiWNxsBX3iGFzQeQQJ
	 tAZFk9Otrm2IS1vrzrOAA/tr4wk5RaSMqpxYeFjPN6RXpi51YZu7w3IpetMdyjOZjE
	 y8xQB9NVbU/csrixgE5fQbSCs/19HujaCV+BIb38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B528F804AA;
	Thu, 22 Oct 2020 14:51:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C57C5F804A9; Thu, 22 Oct 2020 14:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B898F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 14:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B898F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelim-com.20150623.gappssmtp.com
 header.i=@kernelim-com.20150623.gappssmtp.com header.b="At+3qdDq"
Received: by mail-ed1-x52d.google.com with SMTP id x1so1645608eds.1
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelim-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=avUWlQssLaI64nd0ejHAk781pMWV8Uq25xx3UP+1cXc=;
 b=At+3qdDq7YuYFgJWQw2BRtiiWRL/w9eMrUDWZ/zfmYZJ9RbLdKwDfyOPcgVApBiq0u
 YdrH4dJNiNBmjhmFmaVupCEcNUmsZBZ2mZAFLiUladYrRLDTJi270AGcDIaHa4FGB7jO
 xbopqsUFHHwjCf90GZ+l5fEDXAKSa/HfjFUwY6J/KqKd8x0K1SXItk0/7Njv5Kp+/fmm
 8tor4jHun/t1MdS2QTurXDoBfTYlrCW1OQ4uCenvVsr4QxXykCJyPRmVWbFnUoEW4WE6
 P5gUK7oOqoqsGdUxDzeoIUVPkznhfJxZ/cjKC9JgWa6xwEAygTus1BkQ+776GVX/WQDi
 kh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avUWlQssLaI64nd0ejHAk781pMWV8Uq25xx3UP+1cXc=;
 b=olCT8rRffdSc6g/QkjlW7dAiJdPGqWbejxnc5fPTvBMMVY6dXmU1t8aoiKIZ3Lkjn8
 BMP482zC+swdB+VoAWZmDTejTrpPnwvWrgvI/TkLHiJ348oo+NarQWa6ZHtUGnHlb7Qw
 RIzzEacY2yIkX/3KJBxKpCYWh9OiFFDl0AcSpeoA23e3sK4OwyJCftYMCqQ1ZAqos15Z
 2avT/fi2ujbj1t1fVB4HTyu/4ER+z96ugplpPiacCy5joMQAvOJ4mw4ADirt0Es4PJTS
 LiWKfrQYZKBszOEBH3Rf1eCTHKDSqiRNKvQFYrPR/3oHbxzeLfIOm2zN+tgOD3PK+Jrm
 RtJA==
X-Gm-Message-State: AOAM5303qA80atd0ZFYSsz/tJsAVy3D7xN9dSn5+d0lXYnseVNB27oHm
 sp8h3nF6erPWjpZbfBX8jo+wuQ==
X-Google-Smtp-Source: ABdhPJxF3Jib5F6UjRZzL7BSLDiWULMWExJY/IB16/ej4OaI8/yc2fMGJkya9Y0D3UihSvECyqhOtg==
X-Received: by 2002:aa7:dcd6:: with SMTP id w22mr2057933edu.378.1603371064056; 
 Thu, 22 Oct 2020 05:51:04 -0700 (PDT)
Received: from gmail.com ([77.124.42.64])
 by smtp.gmail.com with ESMTPSA id z2sm719375edr.64.2020.10.22.05.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 05:51:03 -0700 (PDT)
Date: Thu, 22 Oct 2020 15:51:00 +0300
From: Dan Aloni <dan@kernelim.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: on-board sound on ASUS TRX-40
Message-ID: <20201022125100.GB1140455@gmail.com>
References: <20201022081746.GA1118484@gmail.com> <s5hv9f2bp2c.wl-tiwai@suse.de>
 <20201022101852.GA1095612@gmail.com> <s5hmu0eblsw.wl-tiwai@suse.de>
 <20201022123347.GA1140455@gmail.com> <s5hft66bfpb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hft66bfpb.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Oct 22, 2020 at 02:36:16PM +0200, Takashi Iwai wrote:
> On Thu, 22 Oct 2020 14:33:47 +0200,
> Dan Aloni wrote:
> > 
> > On Thu, Oct 22, 2020 at 12:24:31PM +0200, Takashi Iwai wrote:
> > > On Thu, 22 Oct 2020 12:18:52 +0200,
> > > Dan Aloni wrote:
> > > > 
> > > > On Thu, Oct 22, 2020 at 11:14:03AM +0200, Takashi Iwai wrote:
> > > > > On Thu, 22 Oct 2020 10:17:46 +0200,
> > > > > Dan Aloni wrote:
> > > > > > 
> > > > > > Hi,
> > > > > > 
> > > > > > The on-board earphone jack does not seem to work on an ASUS TRX-40
> > > > > > board. Here's the alsa-info.sh output:
> > > > > > 
> > > > > > http://alsa-project.org/db/?f=7a94c1b1eec4b2e623c75770364ec43c33d6c95c
> > > > > > 
> > > > > > Tried coding up the patch below, but it _does not_ fix the problem. It
> > > > > > does shows the earphone as 'plugged' though. Verified that it's not an
> > > > > > hardware issue via Windows.
> > > > > > 
> > > > > > Please instruct on how to debug this further.
> > > > > 
> > > > > Did you try to add connector_map, too?
> > > > 
> > > > Yes, and it did not help. Anything else I can try?
> > > 
> > > Well, you need to figure out via trial and error.
> > > It should receive some event processed in
> > > snd_usb_mixer_interrupt_v2(), and you can check which widget is
> > > involved, at least.
> > 
> > Upon plugging or unplugging the headphone, the unitid of 11 matches the
> > unit in `trx40_mobo_connector_map`, although two events are happening -
> > two for plug and two for unplug. There's another event for '7', and
> > changing the second item of `static const struct usbmix_connector_map`
> > from 11 to 7 does not seem to affect it.
> 
> Well, then I'm afraid that it has yet another mapping of the units.
> You'd need to create the whole map from the topology, and rewrite the
> connector_map as well.

Would be helpful a USB trace from KVM, when running a Windows VM that
successfully manages this device following USB redirection? I can
produce this given instructions, if you have them handy.

-- 
Dan Aloni
