Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B89295E70
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 14:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70AF617B5;
	Thu, 22 Oct 2020 14:34:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70AF617B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603370134;
	bh=7gODb0EYcUHHYkgQaHHldwjoAnjjLF+pnRMQnxgJX9I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BWQdfxdIZh1knZpJkmAcNBtZoAy+bh4/6d0om5KuG9ZHxPai2g4j4ZtnxSUsK5xWi
	 lz0K9dqb7J/nyDKRZp6cRJ1sZiNevV9n+pQC0qCobSGyjtQJsDG/n7ZCpGhhlyLJyQ
	 N3OMpNQZUbqhRXGGokQMmBSl/QjgK9ENgPmzxaMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F041F804AA;
	Thu, 22 Oct 2020 14:34:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D806CF804A9; Thu, 22 Oct 2020 14:33:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC0FF800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 14:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC0FF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelim-com.20150623.gappssmtp.com
 header.i=@kernelim-com.20150623.gappssmtp.com header.b="uS9cEjDi"
Received: by mail-ed1-x52c.google.com with SMTP id w23so1602221edl.0
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelim-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6b7yjxF1TBG0L8dNDr6pBhG9cLzrLOK6cF6Pmr+Loa8=;
 b=uS9cEjDi2gBLYgdQZfSOkWUKayAuZ2/y94v8HyjWoObbz8eTU21ehGeUbf05HXobW3
 +7tghKsR3O7w9zEYbUQEa/Sj33LUREUgr2xLb/l6fYw5hW16lXFArv8S/PG0Iazf8KIZ
 fF25ZrmfjrGrxprRqdHJug/VzIl1EdhYfMdsMlcJgibh9+HwAFAcxhtx+pv9T5PV8gnn
 iVxVt5PxOb5R8B0PBvtwuKPfast5PwiSjZEG3UvomRUGZkoHrGxNq0ThV4evlBw2nkLy
 KDkWlTShV2ULs/wTIUvaE3MXrDRqn0zPP+cjuV2ZArzzm3gRMdxxRT2UXiaAT6UnlAXN
 dGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6b7yjxF1TBG0L8dNDr6pBhG9cLzrLOK6cF6Pmr+Loa8=;
 b=DYbKCwNCVxn++ZVZvlwHUxY0wSWqCK8jGp4Rk51R8OApr0cfxNu2dLAtGDCwND5WMG
 cwGpgvfV/X6OMN6MIUskLVFllkX2gN6RmvCHulE0mU+BGkz9pEYPZJObYkAilnCI7V2z
 JexXeVUcP4iMbQmMs9e4Jw1RjpJEfa9Yl51J8XZ24aYN/SidPKYSmmgeuTAr/CxcsGhb
 htoLVp9X20xIZxsaTUScfAlLfcd74fU4fJcwapuHN9VsCx2XGW+SxFx1/yXkZjxK3gLE
 lXCmtoIuH7A6Wgtq3wHIn+Xtf+GxtWE8XjiJis/a1+/eGhu0jYTA4IHX0TRIEzLVBcRB
 vYNg==
X-Gm-Message-State: AOAM5321xQJgGEk9RSptrjGeYfmmjxiSc3y+gaTvdDyLlSlZcGyi06gj
 jJV0ZVUS4EvxyC7vHIsH71Hydw==
X-Google-Smtp-Source: ABdhPJyZ6lcmyNFOblXBMaY0g8zPQJobUncbSdGBCvSdBMUbagTnX6lSfRzrO9rdE4olwItMJLkgMQ==
X-Received: by 2002:a05:6402:22ae:: with SMTP id
 cx14mr2038597edb.73.1603370030707; 
 Thu, 22 Oct 2020 05:33:50 -0700 (PDT)
Received: from gmail.com ([77.124.42.64])
 by smtp.gmail.com with ESMTPSA id i4sm813344ejz.62.2020.10.22.05.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 05:33:49 -0700 (PDT)
Date: Thu, 22 Oct 2020 15:33:47 +0300
From: Dan Aloni <dan@kernelim.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: on-board sound on ASUS TRX-40
Message-ID: <20201022123347.GA1140455@gmail.com>
References: <20201022081746.GA1118484@gmail.com> <s5hv9f2bp2c.wl-tiwai@suse.de>
 <20201022101852.GA1095612@gmail.com> <s5hmu0eblsw.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hmu0eblsw.wl-tiwai@suse.de>
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

On Thu, Oct 22, 2020 at 12:24:31PM +0200, Takashi Iwai wrote:
> On Thu, 22 Oct 2020 12:18:52 +0200,
> Dan Aloni wrote:
> > 
> > On Thu, Oct 22, 2020 at 11:14:03AM +0200, Takashi Iwai wrote:
> > > On Thu, 22 Oct 2020 10:17:46 +0200,
> > > Dan Aloni wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > The on-board earphone jack does not seem to work on an ASUS TRX-40
> > > > board. Here's the alsa-info.sh output:
> > > > 
> > > > http://alsa-project.org/db/?f=7a94c1b1eec4b2e623c75770364ec43c33d6c95c
> > > > 
> > > > Tried coding up the patch below, but it _does not_ fix the problem. It
> > > > does shows the earphone as 'plugged' though. Verified that it's not an
> > > > hardware issue via Windows.
> > > > 
> > > > Please instruct on how to debug this further.
> > > 
> > > Did you try to add connector_map, too?
> > 
> > Yes, and it did not help. Anything else I can try?
> 
> Well, you need to figure out via trial and error.
> It should receive some event processed in
> snd_usb_mixer_interrupt_v2(), and you can check which widget is
> involved, at least.

Upon plugging or unplugging the headphone, the unitid of 11 matches the
unit in `trx40_mobo_connector_map`, although two events are happening -
two for plug and two for unplug. There's another event for '7', and
changing the second item of `static const struct usbmix_connector_map`
from 11 to 7 does not seem to affect it.

[12204.873896] snd_usb_mixer_interrupt, ustatus = 0
[12204.873908] snd_usb_mixer_interrupt_v2: attribute=1 unitid=7, control=2, channel=2
[12204.889894] snd_usb_mixer_interrupt, ustatus = 0
[12204.889902] snd_usb_mixer_interrupt_v2: attribute=1 unitid=11, control=2, channel=2
[12206.233879] snd_usb_mixer_interrupt, ustatus = 0
[12206.233889] snd_usb_mixer_interrupt_v2: attribute=1 unitid=7, control=2, channel=2
[12206.249877] snd_usb_mixer_interrupt, ustatus = 0
[12206.249885] snd_usb_mixer_interrupt_v2: attribute=1 unitid=11, control=2, channel=2

-- 
Dan Aloni
