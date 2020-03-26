Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8F1942B4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 16:11:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 969211671;
	Thu, 26 Mar 2020 16:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 969211671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585235464;
	bh=hAgR+LP5IwX+LWWAHRkH28o9ATxjJcCI+rhKNwqGWSY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ois3KwIdz6nh+VUSX9/kaPrsFVu7qTRvGTcPTMOrTULOsbLVPd8we3/gxlUcfHAzQ
	 OMVpWxhLvSRUQYJ23BPDofrsj3J6RrGZRn4OUEwWnQ0vUwabkFg+q6BTxtTZCWZx6A
	 uvlBn8oWpxhFry2U7+tMFo788IGDFP9O0z5NXOUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 920AAF80234;
	Thu, 26 Mar 2020 16:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1972CF8011E; Thu, 26 Mar 2020 16:09:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1120F8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 16:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1120F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="eP2WmCJr"
Received: by mail-wm1-x32d.google.com with SMTP id a81so7400478wmf.5
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E0GJUQPVsMd5TbC3erUCDPkE9bbfDzqYVz1yZ36hycs=;
 b=eP2WmCJrPPRXBcY/RYIcIP4Wqy0UcogG/a65EmNz4OfNcp0/DMu19YCMbsMqvVw6+g
 tgT7whXqfQTzf2xQz3EL+VOOagUBw3/7Bn6r+ayeoENr+eS4h9Bsuz4EyMT0OHV+HYVN
 h+u37NoAay4nNGFkV0ogNEinbvVmx7a6Bilzwb+EadzQOrkdBJpHmrPWaLA4i7+xPx3a
 jSXpZwcuFmsvXKQOwvrtPqxJOsyZq3iLy3ovqlcKJ7MvokpZlbthZlTvttS72Yk/Nc7z
 gTn8VKHbbAYRoK2VfrMRkYArXo95lauU3Yg6FUPwTiapyOvJx6oYdasw6B7Xc6MPa2/x
 uTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E0GJUQPVsMd5TbC3erUCDPkE9bbfDzqYVz1yZ36hycs=;
 b=cazWt3KYG1hu2Ke/eAaYtboZkqo1EtVLhS0hkxxOvKLNvk21Hasm3w6ywweEKbIqO4
 DSrVw4oC+m3Q4Vc2J8SdvSO4RYRFtvTkyJKIjC2p4kl6bn7zyja5DDrM08y4EI9ymcT3
 SczAzvDWc0ldEKDX7fm1PzxmIfx3Trnq2X7TeNdumt2rVm5jaKzu28fG+4Vq5QjkKdRO
 0kIPP236iqQQw73uoGGHL+wudPTsj4lcWALbor20T7xycOieq+HgDJXgaBD82kvRYOOi
 KEk+bn/sQMuLptNzUzbYU+HsxA4yUVwxOUWOg5P275FBiwSBGYLlKYRKx4iNUOfzeFbl
 lTLw==
X-Gm-Message-State: ANhLgQ0Iw+Ui3lJoacOzR2/A2LYVcu2SnUcsvsr1sOKt+CfPYqwsek2m
 P6fvE/Etim5DhtLLoWnyptcALzIyt6uDPQ==
X-Google-Smtp-Source: ADFU+vvNmnw9M189Loxx6OENxpQCbO/5e2+radcNIN6Y5Fh23XaAcmUzBACxoomX+YwWUSWbeNmgCg==
X-Received: by 2002:a1c:9e97:: with SMTP id h145mr373802wme.61.1585235355218; 
 Thu, 26 Mar 2020 08:09:15 -0700 (PDT)
Received: from ?IPv6:2a02:a03f:c930:4300:2b1a:3a25:ef77:ee9e?
 ([2a02:a03f:c930:4300:2b1a:3a25:ef77:ee9e])
 by smtp.gmail.com with ESMTPSA id d6sm3979031wrw.10.2020.03.26.08.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 08:09:14 -0700 (PDT)
Subject: RESEND: [PATCH 6/6 V3] ASoC: tas5756m: Add DT binding document
To: Rob Herring <robh@kernel.org>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
 <20200308142509.27765-7-charles-antoine.couret@mind.be>
 <20200309203847.GA31358@bogus>
From: Couret Charles-Antoine <charles-antoine.couret@mind.be>
X-Pep-Version: 2.0
Message-ID: <d732e234-dcb9-d352-2f31-22c5801e8c28@mind.be>
Date: Thu, 26 Mar 2020 16:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200309203847.GA31358@bogus>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

Le 09/03/2020 =C3=A0 21:38, Rob Herring a =C3=A9crit=C2=A0:
> On Sun,  8 Mar 2020 15:25:09 +0100, Charles-Antoine Couret wrote:
>> Document the bindings for the tas5756m driver.
>>
>> Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>=

>> ---
>>  .../devicetree/bindings/sound/tas5756m.yaml   | 64 ++++++++++++++++++=
+
>>  1 file changed, 64 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.y=
aml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Error: Documentation/devicetree/bindings/sound/tas5756m.example.dts:23.=
37-38 syntax error
> FATAL ERROR: Unable to parse input tree
> scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/b=
indings/sound/tas5756m.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/sound/tas5756m.example.=
dt.yaml] Error 1
> Makefile:1262: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1251057
> Please check and re-submit.
Hi Rob,

I don't understand this issue. My example is based on a real device tree
and it works fine.

I don't have access to your
"Documentation/devicetree/bindings/sound/tas5756m.example.dts" file so I
can not reproduce it. I executed your script before sending the patch
(but without extracting the example) and it was fine.

Can you explain the issue please?

Thank you in advance and have a nice day,

Charles-Antoine Couret

