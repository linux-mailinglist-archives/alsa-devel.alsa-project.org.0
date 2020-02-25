Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7C16C25B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 14:31:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 211E5167D;
	Tue, 25 Feb 2020 14:30:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 211E5167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582637462;
	bh=LjoAlnUOfz7B15Oh06w56z8MAYtM1HhtQCggxvmDW/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McttmmsisF0vjH6Lh0Svz3v/r39mq07cDz/6vnGDAGcBZ8fD5GHG31Y5lTg0RwFIj
	 8xhiRr2aBs63fqXOTm+M6A81mX6W6tiIAbFX6z2rD9PlE8LSzTFqlxZ/HamVTnQkmq
	 2wPDZEXx8+GRbMeTSPqenTq8XYLkDSEgUMS3WYPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20CD7F80090;
	Tue, 25 Feb 2020 14:29:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30EFCF80142; Tue, 25 Feb 2020 14:29:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7B95F80090
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 14:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B95F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p5gkxScV"
Received: by mail-lf1-x144.google.com with SMTP id s23so9748540lfs.10
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 05:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J5YGUk8kDLWUcN6FO7jMtSAEeHUxuzzxjpTLzQYYweo=;
 b=p5gkxScVwAoyrKk4a4rxpdI8CwjXi3s/gwjb96f6Wq8DMh7+ckHj9cHqtX2Xmvz4PC
 zFcgBUKSY4FDQwgiUQ1XvB35OKkR6W+nk+ZtQFq+vso7pZIo6d8loNtErwQb9q7kG8Kq
 t5+fPBMlWvWaDtcGkjDyWNc5r+VPSLrGb3Y/PgD7A+08ySrZv+T/s3Jpy8HTfsIXKRT3
 9ulKYZZOdKaOtTytuTsDglE2qRWURjKzH8/TJGNqNerCXFTfAaczzTneYndUttFmAj6r
 n0eCaa+1Lcyvkm5CoaTn1hZaw0uCMlq+ojmfQ03coOvxRxDckBLwgAAnOb/Sp9x0MF0l
 zS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J5YGUk8kDLWUcN6FO7jMtSAEeHUxuzzxjpTLzQYYweo=;
 b=DJP+wGpVA82l0xNiVahDJDxo3TmSJWRuPKKlb0HdbhMUzspXboIWjusMCj7Cnx6YZR
 YMoNJK/vZtaRCYYoYuX50UP7ZnG6wouIfSea8mgjWTUqxzGY56dAl3Yq01qiKfgkm74F
 ThfNumWPTnovz5ewPfvAFdS6g5/7DMjrMxDS0IpiZOTPyYbaV1L9BFYT3N8MxMJQgaBp
 TTlf1R09jYMKlctJeyXt4efaqWFsiK/oJg3nDT2gvMYsXjlTcrHrwcfuQfPmU6HorLb1
 88QlEFJgRK87Z2p0IkL2m/ZRbr3CC31x3p8c646DiYA7zldwmdQcqAZRKQCTGzoiP8FB
 ZOzQ==
X-Gm-Message-State: APjAAAUYlBvgu8RNnjqTCUt7jBE7vv7gKDeg++gcyWXcZ10y0DsSrL07
 /mOIwPIRCAkRsGjkuKSdL4SSHkSGub7n047Ejw0=
X-Google-Smtp-Source: APXvYqw3oHtn5KjqRvE1g+6UE2ciKFKZF1TT8oRFN2lxJXdMFSeR/r0UOh+jyirs0SD3FwQmtigjkFxNiZtJu4xI81k=
X-Received: by 2002:a05:6512:10d4:: with SMTP id
 k20mr14161107lfg.70.1582637353133; 
 Tue, 25 Feb 2020 05:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20200128144707.21833-1-daniel.baluta@oss.nxp.com>
In-Reply-To: <20200128144707.21833-1-daniel.baluta@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Feb 2020 10:29:03 -0300
Message-ID: <CAOMZO5CKda0TEai5CDdkmADNSMnn3WvY_xD42a=PMpzUFO4Z-w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: Add generic CPU DAI driver
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "peter.ujfalusi@ti.com" <peter.ujfalusi@ti.com>,
 "broonie@kernel.org" <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

On Tue, Jan 28, 2020 at 11:47 AM Daniel Baluta (OSS)
<daniel.baluta@oss.nxp.com> wrote:

> +static struct snd_soc_dai_driver fsl_esai_dai = {
> +       .name = "esai0",
> +};
> +
> +static struct snd_soc_dai_driver fsl_sai_dai = {
> +       .name = "sai1",

So the name will be hardcoded to sai1 even if SAI2, SAI3, etc is used?
