Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB19620C55
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 10:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32618857;
	Tue,  8 Nov 2022 10:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32618857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667900139;
	bh=rzD8046fY9Wxqt77zLPJ35cy8vaOehEkiOjcqiFU43M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNd8hGMh2uOs6wNEtKelfgoNOpYwr2Jv3pEfwvxOW6mopQCytryNjSFO4Vbxeg4v4
	 G31VITBN2P5b4qNrFc1Sr95Sn2CGOEQjW86guCLIZ3K5WT2kNLx7z0jtekTQzwQPTQ
	 LD8/3WvsBnsjp+gnzDGM7JFai3Tvc7smtCcvix70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE5ECF8016A;
	Tue,  8 Nov 2022 10:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2CAF801D8; Tue,  8 Nov 2022 10:34:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04864F800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 10:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04864F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="btdjLf5Q"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7AB0B84C17;
 Tue,  8 Nov 2022 10:34:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667900075;
 bh=6TJ0gWK6O+d/ZcBQMv3snmoFYLu65pHxufsc+8ybjJw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=btdjLf5QikZ7vtHiVpeaIlLAl/nZSjvSoyyjM+AYychDx6LZITxkXjX67K1qqJlYJ
 MdtDZkL80ULMzOVgb9NiDD7foVVr3044N1VA5sV51IC+7xozGz8BYpd7Mr31YUAH+/
 +kyI+il9Fn11rkmDT2ztRfikTWR/82rgkwEAQRJ8185Lr4dY0m2oDCd94N3Ld76A55
 tEQy1YHka3QG9VME8RHB9eJsO29f1+rExb+tOFwYETZzHNdvR5tnMJJY2RDZeItwq6
 3hXNftW6POW1SBfIHznEXU8hQgiTaX3ZSqov2D6lEoRRXrsbf2KHnvA74aKLIJlLtf
 WXEFug9+PfuZQ==
Message-ID: <b1bc4bda-2996-3322-a9b2-90dac43253e2@denx.de>
Date: Tue, 8 Nov 2022 10:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] ASoC: fsl_sai: Enable transmitter when generating MCLK
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@gmail.com>
References: <20221107215201.434212-1-marex@denx.de>
 <CAA+D8AOGLUKfg6sfkf7k4P8XnQdDHpjmy4jQK648Mnmupuugyg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA+D8AOGLUKfg6sfkf7k4P8XnQdDHpjmy4jQK648Mnmupuugyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
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

On 11/8/22 06:29, Shengjiu Wang wrote:
> On Tue, Nov 8, 2022 at 5:52 AM Marek Vasut <marex@denx.de> wrote:
> 
>> For SAI to generate MCLK on external SoC pad, the transmitter must be
>> enabled as well. With transmitter disabled, no clock are generated.
>> Enable the transmitter using the TERE bit.
>>
> 
> It is already done in trigger(), why need to do this operation in probe()
> and set_bclk() again?

The system I have here has SAI MCLK (output) connected to SGTL5000 codec 
MCLK (input) . If the SAI MCLK (output), the codec I2C interface won't 
work. That's why the MCLK must be enabled so early.
