Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17323C4F3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 07:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 530191665;
	Wed,  5 Aug 2020 07:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 530191665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596604642;
	bh=/n77pfE4a+GOKvicmljT/QtRWcD5OcaFIdllbQ5Y/wY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKGdoiBocJ2CXdLs1Az/3vDlGHBitnfKP9bFJjVxIn+sARxJBbWg5nxcRCvpHxKwF
	 5l4EEoUMyBH4VqfKJIQcVLz/Vgn2EsQ7XZVLHIoEbebS+P81mSq2ov4yogsELHbRt3
	 3mQekBpjSCQqg5grJrgzFAiq7l/Gu0o9eXgHOrGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D705F80234;
	Wed,  5 Aug 2020 07:15:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519EEF80218; Wed,  5 Aug 2020 07:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3AD3F800B7
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 07:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3AD3F800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AFmxb7f8"
Received: by mail-pg1-x541.google.com with SMTP id j19so23747169pgm.11
 for <alsa-devel@alsa-project.org>; Tue, 04 Aug 2020 22:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/n77pfE4a+GOKvicmljT/QtRWcD5OcaFIdllbQ5Y/wY=;
 b=AFmxb7f8d9u4khyrON5HeLJwb1Qw5QvNvEXE0doBoJbYvgEvXafs8WeN9n7auMuuAF
 VXPoMIf1mSknY/cVdcBCMW8L6eBpi4J7dwrN5Zi5PLjH2PUm8Lm7V2AYxw+rb8ThXBik
 KLVB5HrUo+2v2qtsNCpehTNZab+H5ACdib6DdIPEi78GG/7snFgF+lh5TBGT6HNOd3xU
 ynDWad+UVkv0Xo5MvddZnnu5tENt9XHaqz9D1HtZzAGoWAnepvaHLfsVnBRgKBv6RWsk
 USORzkHoGh/7EGz5XAWvITM5OjG1m4qrxdoQSKJAubGvkJ+0kEmsUD31VGsdMKqjH5++
 mSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/n77pfE4a+GOKvicmljT/QtRWcD5OcaFIdllbQ5Y/wY=;
 b=ncizUy8HiBhaFUgkxBV/wseC0pqLMm27onIJX60v4R/CJ68QIVNLEzkpw6j+4sSYfs
 eU4SQV+rxNhqFNq8ryibEwgj49hyH8hQv3+i8I3+VyS/7YmBK43jP+QY2JSI1tGoGw9T
 AjSBwhTPffuNDKg+nhvm4vRt9QaC2vJFKCUfpQTlkWUNY2zefWhB898dAJr81TLAzM7C
 wURGwa9ssAPlXFXgLY9/tKftU96iJytXkWo3SGXHmt1wYzt6v+YKX657iMVUdYMKfHiS
 j2DQbfrC80/n0ADiDcDu57L8YbTIxidQUNyt5fyETOUG9+f0N5Hj2o0X8M1xJw1/y3M3
 VDMA==
X-Gm-Message-State: AOAM5300buTK8G7SovWy6KJRfSXJUQc3mhDrdhV92grf+ZnRAgJ8bSYh
 ykfuNP7cAEEGBUPy9KYVLl4ZeOTieok=
X-Google-Smtp-Source: ABdhPJznedC2BZI3gT80R+gKb4MGfnESYyp4nkwqsAQ81pws/5kKeVDVr8qut1B0dpAbnle7RGQ0Gw==
X-Received: by 2002:a05:6a00:14d3:: with SMTP id
 w19mr1664143pfu.92.1596604526362; 
 Tue, 04 Aug 2020 22:15:26 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id h5sm1322799pfq.146.2020.08.04.22.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 22:15:26 -0700 (PDT)
Date: Tue, 4 Aug 2020 22:15:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence
 for synchronous mode
Message-ID: <20200805051511.GA29129@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
 <20200805041111.GB10174@Asurada-Nvidia>
 <CAA+D8ANv-qURC_wu3TzWiiiCAXC88Gc+WGssdjmuWoLPTRm3pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANv-qURC_wu3TzWiiiCAXC88Gc+WGssdjmuWoLPTRm3pA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

On Wed, Aug 05, 2020 at 01:03:37PM +0800, Shengjiu Wang wrote:
> > Btw, the new fsl_sai_dir_is_synced() can be probably applied to
> > other places with a followup patch.

> Do you mean move it to the beginning of this file?

There are other existing places testing "sync[tx] && !sync[!tx]"
so you may submit another change to replace them. But, yea, will
be a good idea to move that helper function to the top.
