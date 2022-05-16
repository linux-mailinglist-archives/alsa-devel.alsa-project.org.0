Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A652352A2BA
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 15:08:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A5015E0;
	Tue, 17 May 2022 15:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A5015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652792926;
	bh=GMAsGP5N+04yLBnWdi+wagIxEoCorFMEM+proBrI8lc=;
	h=Date:To:References:Subject:In-Reply-To:From:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkwoePT3UuOX0ng55U08IRSO9HRJwoHlqB8uDASE1dZvO/vt7QHUUrycRiufpkVOn
	 Ql9D7hCyofUdAc50zwlxYxmSVBj892uUcd0BdNmCTZYmDYRpLWeocZmSD9Yf+nGTeb
	 0keWprj6++saivB3xdZfCzBysA5r+E3dj+MroyDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 463A0F8051C;
	Tue, 17 May 2022 15:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E01B8F8014B; Tue, 17 May 2022 01:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75579F8012C
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 01:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75579F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h9sz0Fc4"
Received: by mail-ed1-x52e.google.com with SMTP id g12so5006964edq.4
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 16:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:references:subject
 :content-language:in-reply-to:from:content-transfer-encoding;
 bh=faSFFFCYgfZhm7yFYiEZrr+4wyXWLD1FhtB7m1b/5Ns=;
 b=h9sz0Fc4Xny9nOcmF7rpJGLVKhQcaT4iVe4oKE1ton9uhzWzSwGPufhVXFqmN2ng/k
 7xePaGh0MY1MdkVtVoP1ZYbWz8TkpxcPniTX3et02AN0FHKQ53p0rIaqUXLi+A3bs0AJ
 jYMKFdYF1DOg6HNu4z7RBbEAQF5tly+3RzGFPC4cFLxjUoDLKezKrvKkF46ng0DEvgx9
 +iiGUwZ0OfFV4AVFnfYF9N0d5Ig6I+O4mh4shh5h5HztJTIv8ByDocC9VVP1Nt9F2jLt
 DF5YenWlxGdMqqCgAK2gCb+dMpTywSAc2CLSSuNODxF7vR1Jca9JT5hNWKKrtbMQvVkt
 /JzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :references:subject:content-language:in-reply-to:from
 :content-transfer-encoding;
 bh=faSFFFCYgfZhm7yFYiEZrr+4wyXWLD1FhtB7m1b/5Ns=;
 b=RgKPxP+FrsFvipIns5hq9/ZFqePvP3Guiclu2Rf9eUx9sVbbC5B2nZ/KMDFNFjp0OE
 t9AF4m6nwF7X8Ev5pg8HXrCmenqZPHJBLBU1wwIGMp/D2jc3Ft5Tu4yitiy6mxMdMPNy
 TLvdDZBVhE3VCUVnfPnukBBR2E9MBbzWOOLd/Ftvo//vILwnev5bCBtVA2bdEOJjbO3u
 ogDGTDP8lSz8/R7ecaIC8P07R+eAsPXi+jurQ1TwdiN/6F/fO/6r5bGanyAajuTtzEif
 S9No1dOTvKVLX+2Dp6iCqyfAHd1Z/2Syc/h0c0+zp5tgAKi3cZrAfnOfA0h0dZFumVAE
 TcQQ==
X-Gm-Message-State: AOAM533Ui1b2AVdQYOClDXVtMRKM+0Br46GV+yZMbvRtj3USkzU82FEu
 H21pJX6SB6V3Blyk4EIFSAk=
X-Google-Smtp-Source: ABdhPJwb/F4Y7l6ajled1hbWRATI/4fqkYMtJ7Rcb8EMEf8glJfqC9e5d3kCq6FVUQ7GLXu2fA2UiQ==
X-Received: by 2002:a05:6402:206f:b0:42a:a8c1:1637 with SMTP id
 bd15-20020a056402206f00b0042aa8c11637mr11040288edb.302.1652745206545; 
 Mon, 16 May 2022 16:53:26 -0700 (PDT)
Received: from [192.168.1.110] ([178.233.88.73])
 by smtp.gmail.com with ESMTPSA id
 u2-20020aa7db82000000b0042617ba63a7sm5906624edt.49.2022.05.16.16.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 16:53:25 -0700 (PDT)
Message-ID: <c2163c71-2f71-9011-3966-baeab8e8dc8f@gmail.com>
Date: Tue, 17 May 2022 02:53:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: marex@denx.de
References: <ee74ed25-cd10-1047-9700-7546c7ee7052@denx.de>
Subject: Re: [PATCH] ASoC: ops: Shift tested values in snd_soc_put_volsw() by
 +min
Content-Language: en-US
In-Reply-To: <ee74ed25-cd10-1047-9700-7546c7ee7052@denx.de>
From: "Tan N." <tannayir@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 May 2022 15:07:02 +0200
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 alexandre.torgue@st.com, stable@vger.kernel.org
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

The same changes that are applied to the snd_soc_put_volsw should also 
be applied
to the volsw_sx and xr_sx put callback functions.

Most of the Qualcomm codecs set the volume levels of controls like this
-- SOC_SINGLE_SX_TLV("IIR1 INP1 Volume", LPASS_CDC_IIR1_GAIN_B1_CTL, 0,  
-84, 40, digital_gain) --
which causes the values from the caller to be rejected incorrectly on 
the put callback function.

It took me a lot of time to debug this but because those two functions 
aren't changed
in this patch, it creates an issue where some Android phones have extremely
high amplification on the sidetone mixer during calls which in turn causes
a feedback loop because the kernel can't set the correct level on the 
controls.
