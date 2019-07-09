Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11F62D39
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2019 02:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC1B01666;
	Tue,  9 Jul 2019 02:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC1B01666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562633974;
	bh=ePBJc1BOxEkT3IRrHg6/NWDCo6mUCwEj+f6i75DSkYM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJLwZT0ydp7Br4daSduCvm/bezXLSnhyFBHNkKwqvQHiQZBFcmHkn+NcauSr4E5k+
	 oDmcbHKq/w6P32KvZJraJlc4cd8r+0nvowYvyKiO070QnWbQIvJw1pBmJsx+mj0ywF
	 UpGy2g3X4Uv+49GsnXsLKwVXKZZ9QYEWSH+OvzZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD82F801EC;
	Tue,  9 Jul 2019 02:57:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CAFBF80268; Tue,  9 Jul 2019 02:57:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3C5CF801D8
 for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2019 02:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3C5CF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jOogLk7R"
Received: by mail-pg1-x541.google.com with SMTP id s27so8538266pgl.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Jul 2019 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ovvmvLXcN2WNj4sNwe4p/Xee5jrLgpchDLjIPq6YmSs=;
 b=jOogLk7Rn8Qffuitf+GhyMJJEvfkhY9IoNwS0oiC7kgcxvC7hcWLNLfZCUrkWrDkCt
 wzgyXYIcGChGJDMVffK9I1JdgAzPspuhFwRarpxbV5ScMXNuEvxZrvEDGbU9z1nQ4Pby
 C1yDzOfctZM5xNzF2j2UiOwnIsTn51sw0qWaQVMSzViDl+vwipjaZe3fUkopGq3l/Wbx
 tt9cdaScy+RIVLtLU3i1ovTXtDGK1YWnixyAl+r9uq9Helzuk0UuLWE7CoJP4gsVraSN
 4HLbVTv9AgzQmw/bN8ZC1ZEZN6TgykRtfBo51TTpeNsibZ2dTmm3NDlHDEP7S8r4r5/M
 F3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ovvmvLXcN2WNj4sNwe4p/Xee5jrLgpchDLjIPq6YmSs=;
 b=et2CDIz3zL6PCy2fUVgKRcXyLRBjZ3KBb3FAuhLt2rvBmZlrIr9nlIoxKn/JWhw96H
 AgZrWV68fVOcyzP6Qj1JVLT5Xj7ABbhvDJ5hSKtK+EEMxWKxaIyUJmzREA2BNhWE7KKK
 7uvNq8sV6hFj7uMi76YTlg38WZ68UX0D5SUGArpSWhDpGRUuZXn1IfY23Q3bgHkNSj0U
 rFti98IJuF+M+ZUCmPCHJrub3TqBacC6wFjqJvzalusvdQ+oJhCGwsgfxGiIkzDV6vMT
 4XiS0KCYvkTBOjv+3kARK8DxZtuiXsQW3LVKnEcP0OVm9U1G+1vAoKN+oU6yQVLxSP1C
 ARyg==
X-Gm-Message-State: APjAAAWAB9FHDo9fpf0nwuejPTiGuZObwselAMRiDOSO1YUBY8yy/s/r
 0FwXJBA7jniY/0/g7zsaM30=
X-Google-Smtp-Source: APXvYqzSNUuTjgHJHseb1sIy2Pn9KXojzGnULdltP79uHnrMd5CKKPPe2fjbRm0R5Ggc8XUaiEF+bw==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
 t20mr29371769pjr.8.1562633861026; 
 Mon, 08 Jul 2019 17:57:41 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id q1sm32442857pfn.178.2019.07.08.17.57.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Jul 2019 17:57:40 -0700 (PDT)
Date: Mon, 8 Jul 2019 17:58:10 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190709005809.GA28003@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64796C22C2D41B9A45E726BEE3F50@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64796C22C2D41B9A45E726BEE3F50@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH V2 2/2] ASoC: fsl_esai: recover the channel
 swap after xrun
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Jul 05, 2019 at 07:03:47AM +0000, S.j. Wang wrote:
> > 
> > > +
> > > +     /* restore registers by regcache_sync */
> > > +     fsl_esai_register_restore(esai_priv);
> > > +
> > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> > > +                        ESAI_xCR_xPR_MASK, 0);
> > > +     regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> > > +                        ESAI_xCR_xPR_MASK, 0);
> > 
> > And just for curious, can (or shall) we stuff this personal reset to the reset()
> > function? I found this one is a part of the reset routine being mentioned in
> > the RM -- it was done after ESAI reset is done via ECR register.
> > 
> 
> There is a problem to do this, TPR/RPR need to be clear after configure the control
> register. (TCCR, TCR). So it seems not only one place (reset function) need to be
> changed.

Do you know (or remember) why we suddenly involve this TPR/PRP?
The driver has no problem so far, even if we don't have them.

The "personal reset" sounds like a feature that we would use to
reset TX or RX individually, while this hw_reset() does a full
reset for both TX and RX. So I wonder whether they're necessary.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
