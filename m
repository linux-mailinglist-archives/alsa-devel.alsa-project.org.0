Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42F02961E8
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 17:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CA21732;
	Thu, 22 Oct 2020 17:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CA21732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603381907;
	bh=Qq7J3uROksiCIe7Q7I8vNZHPoIklEPojJTvNHzH5gEw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mkAn46w1fu2SJiluvD5GZoTlKPhbWBLg5NKIrq0Kb0Iqg1hZ0RASP7OVP6oeCGD1O
	 d7dziIYVh4yfICNaAF/yRipnee9p/y/fZ0gpp8O7KniiJ0NNqIS+icTdIvT71yaVkS
	 k71zqLdF9SiHZ/9PVJH3I39GyXum5r/fFA8A0yWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92623F804AA;
	Thu, 22 Oct 2020 17:50:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24156F804A9; Thu, 22 Oct 2020 17:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205B7F80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 17:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205B7F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernelim-com.20150623.gappssmtp.com
 header.i=@kernelim-com.20150623.gappssmtp.com header.b="zGJRXie0"
Received: by mail-ej1-x634.google.com with SMTP id o26so2991332ejc.8
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelim-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=85X5dWkRmgdWiKsJtAJgXyvdamAruBbo9SUov6R5Svw=;
 b=zGJRXie0B44/eI4EucWQCjLmZa51NuOiCahFtTL5bWnmuxT8giuAgLDc0x8v+8XlhF
 EKwCUxSF3ViFz6rCsXbZ4jpMD2+j6lBvSkTyCJupIAIfGl5JS+mT8DS2P+tkfJit+IcQ
 fjH0CoTz6zrwnvy6WijfMyfvZKkkTPtJD0SD+ln6Wlj6Z5kHeLbMW1hSReN5EHxMdTLn
 B0hXu2JXws0vu20bi9ZLhNl/jmloIiyuOpSl9dd82lBAoSwRYw4JH+UQQfpt5ApC6Wcl
 QCwPK1aBfn+7qTmt9onfbbHTwK5NyCOqqbEJmRmbGKc4YY6TQUaGNyz7I99kefF6nsKD
 tuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85X5dWkRmgdWiKsJtAJgXyvdamAruBbo9SUov6R5Svw=;
 b=kFKmUvKuu+Soufn8fXi0d9CrpG7J0AeldFu7DUPV80OIxHTZGSuYR2ebvxxippD19K
 LV4+izWspNQu8AuO73uE4zNvT8pZOUf1iBc1V/DQYsOws/W2MtTyGsD7FcapUz0Sr2wX
 lcl9IhStDPuSeHZIwxXSxd2AfYEiE6wOxdrSrt05O5Ru5SEKUICMHwYVriZsusMd8hWx
 7fDjybDYpvKRqIdvGvLbtWtDsSL+A2vRHABvvkvArqM3p8v9rPOJ2vHEPtnShpuBySo5
 dz91htOTSnH6iLpkQByRS88vO8wud5FZw4is4HJg90nJ/c2QUrrOu9i5vzqOecaZdhdW
 seuQ==
X-Gm-Message-State: AOAM530y5Bb0hK6VfXXRFogkVNS4C1ZPR5WdQtHLuR8mdSSvq25bOEfM
 SZZrMHWvTsjIB1GRfpDn0+3N77d8/xj1+bHf
X-Google-Smtp-Source: ABdhPJz/1xvBK5+mlhOpblXknpaTZpK+4B6JMwcpUY84KxrYXIYMaWrSpgbJcA86dEGnrjya3hMy9Q==
X-Received: by 2002:a17:906:468c:: with SMTP id
 a12mr2761659ejr.269.1603381802609; 
 Thu, 22 Oct 2020 08:50:02 -0700 (PDT)
Received: from gmail.com ([77.124.42.64])
 by smtp.gmail.com with ESMTPSA id y3sm1094415ejk.92.2020.10.22.08.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 08:50:01 -0700 (PDT)
Date: Thu, 22 Oct 2020 18:49:59 +0300
From: Dan Aloni <dan@kernelim.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: on-board sound on ASUS TRX-40
Message-ID: <20201022154959.GC1140455@gmail.com>
References: <20201022081746.GA1118484@gmail.com> <s5hv9f2bp2c.wl-tiwai@suse.de>
 <20201022101852.GA1095612@gmail.com> <s5hmu0eblsw.wl-tiwai@suse.de>
 <20201022123347.GA1140455@gmail.com> <s5hft66bfpb.wl-tiwai@suse.de>
 <20201022125100.GB1140455@gmail.com> <s5hd01abep7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hd01abep7.wl-tiwai@suse.de>
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

On Thu, Oct 22, 2020 at 02:57:56PM +0200, Takashi Iwai wrote:
> > > > Upon plugging or unplugging the headphone, the unitid of 11 matches the
> > > > unit in `trx40_mobo_connector_map`, although two events are happening -
> > > > two for plug and two for unplug. There's another event for '7', and
> > > > changing the second item of `static const struct usbmix_connector_map`
> > > > from 11 to 7 does not seem to affect it.
> > > 
> > > Well, then I'm afraid that it has yet another mapping of the units.
> > > You'd need to create the whole map from the topology, and rewrite the
> > > connector_map as well.
> > 
> > Would be helpful a USB trace from KVM, when running a Windows VM that
> > successfully manages this device following USB redirection? I can
> > produce this given instructions, if you have them handy.
> 
> The topology is found in lsusb -v output.  It's the connection among
> units.  More importantly, the maps only care about the certain units
> like input/output terminals and feature unit.  You can look at those
> and correct the corresponding unit ids.

It shows 6 triplelets of input terminal, feature unit, and output terminal,
and they are structured like this:

    IT[7]  -> FU[19] -> OT[13]
    Line-in             USB Streaming

    IT[8]  -> FU[20] -> OT[14]
    Rear Mic-In         USB Streaming

    IT[9]  -> FU[21] -> OT[15]
    Desktop Mic         USB Streaming

    IT[10] -> FU[22] -> OT[16]
    Headphone           Speaker

    IT[11] -> FU[23] -> OT[17]
    USB Streaming       Headphone

    IT[12] -> FU[24] -> OT[18]
    USB Streaming       SPDIF interface

Not sure how to make sense of that to a usbmix_name_map array and/or
usbmix_connector_map array combination that works. My trials so far
have not yielded a good result.

-- 
Dan Aloni
