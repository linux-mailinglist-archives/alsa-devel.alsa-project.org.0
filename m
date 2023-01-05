Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DED65F67B
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 23:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A76F122D3;
	Thu,  5 Jan 2023 23:09:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A76F122D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672956622;
	bh=eEt5WoqZxk5jGA3A1BZyFJhQhx+wAYMb8uclQzYe8zA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ltZ7f4dILeA3omI2aFr/MDDK7j6jFOP20kdbNgfgcoFXeDJTwS8kSGc58VIoMkCkH
	 b12SuBOea1P/EZgJQUY6/fgEWhuOA2QqXXjSKwdoTApcrtZ9e2tsJLvR50bbauqM0d
	 d4N90HDEDZJVL+vDoxO8+//MDzjkyGsSpI6dOezE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F246F800C0;
	Thu,  5 Jan 2023 23:09:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B82F804AA; Thu,  5 Jan 2023 23:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 961CEF80238
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 23:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 961CEF80238
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WxsdcKEz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672956548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=idk7zwMeN8Ms5ELQH7d2B6f/MLuOIPR3AtkkFMxBOP4=;
 b=WxsdcKEzoRuvf4DRT79vN2pF0Mp4E1Y47672tB95E4Dut0Tp9JW4OaXFOKCk3U1T4G2rBb
 MOORUvmk9k35z9vnJTIiUNUlf+7zYNXD/NvUoEJfTmCV1HS+bnsKRgTRexDcRl84IEsWDy
 pOr45HI+F2tP74UjVyKGfwNuKEMOSP0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-120-q-Sd4Ay5O-m3tr5iE9kNQA-1; Thu, 05 Jan 2023 17:09:07 -0500
X-MC-Unique: q-Sd4Ay5O-m3tr5iE9kNQA-1
Received: by mail-qv1-f71.google.com with SMTP id
 d16-20020a0cfe90000000b005320dea1ed5so2053070qvs.17
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 14:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-language:content-transfer-encoding:in-reply-to:mime-version
 :user-agent:date:message-id:from:references:cc:to:subject
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=idk7zwMeN8Ms5ELQH7d2B6f/MLuOIPR3AtkkFMxBOP4=;
 b=LIA0a6j0bXsJ7AtZRtFXzejIImpCHPbBpjgPcSkjOzyqbjXI2jR4VMM817F/916dnJ
 hdPwE7jWgN9yZzOyci9RJBaWenIIbHND1W+vemMTr3g3lyCQPlu0pr2aufCLrwKB1g37
 Ysg12eCUmtGuzv8Iszkjpnqp1214969KK5b0IN3eUfHP5HqKJyZvoUPTSHdmlKUGiQrp
 ILH0qi2xc06LwBmR72ykDeKfID+O3pzRMCu0g8CK06trjUncopTPCSQGKeaVcywdKTBd
 dHXDPIn0tSEMo1h8fuKHhLIilQorADdaeqVN/PnBHHfI4OsUc02qCGl1qj3Xu/0INpwJ
 U30g==
X-Gm-Message-State: AFqh2krUIOgN6b61AoFM+bnTvEKnrQk6r8OdFCnIM49Qvph/x+/a1vFX
 GRDwc0w2k3HkgfYmF+L2GlB00RsfeT4pTLUehV8HsTeAfjE7CJ3FVCS3HxMwVUF9d/ngCxBRbfa
 Zz+f2WJSYeTsg97Bt9LDq7js=
X-Received: by 2002:a05:6214:2e81:b0:4b8:8a31:5741 with SMTP id
 oc1-20020a0562142e8100b004b88a315741mr71801215qvb.15.1672956547176; 
 Thu, 05 Jan 2023 14:09:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXughyad3qrXR+35kG38zogh8DNxPC/6FgPkh/1kss3XlBPgAaxGNhEBt42C/e4ZtH94rv6pbA==
X-Received: by 2002:a05:6214:2e81:b0:4b8:8a31:5741 with SMTP id
 oc1-20020a0562142e8100b004b88a315741mr71801183qvb.15.1672956546809; 
 Thu, 05 Jan 2023 14:09:06 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 pj8-20020a05620a1d8800b006cfc7f9eea0sm25787894qkn.122.2023.01.05.14.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:09:06 -0800 (PST)
Subject: Re: [PATCH] ASoC: amd: Return ENODEV if acp63 is not found.
To: Nathan Chancellor <nathan@kernel.org>
References: <20230105211912.824250-1-trix@redhat.com>
 <Y7dF3VvQs6l7rr3p@dev-arch.thelio-3990X>
From: Tom Rix <trix@redhat.com>
Message-ID: <3921856d-7843-4206-f888-4ac48cdc97e4@redhat.com>
Date: Thu, 5 Jan 2023 14:09:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <Y7dF3VvQs6l7rr3p@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, ndesaulniers@google.com, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, Syed.SabaKareem@amd.com,
 Vijendar.Mukunda@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 1/5/23 1:49 PM, Nathan Chancellor wrote:
> Hi Tom,
>
> On Thu, Jan 05, 2023 at 04:19:12PM -0500, Tom Rix wrote:
>> The clang build fails with
>> sound/soc/amd/ps/pci-ps.c:218:2: error: variable 'ret' is used
>>    uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>>          default:
>>          ^~~~~~~
>>
>> When no device is found -ENODEV should be returned.
>> A switch with a single case is overkill, change to if-else.
>>
>> Fixes: 1d325cdaf7a2 ("ASoC: amd: ps: refactor platform device creation logic")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> Thanks for the patch! I sent basically the same thing earlier today
> (sorry for forgetting to Cc you directly) and was told it was not
> correct:
>
> https://lore.kernel.org/6bb126b7-1cb4-0c4c-d357-fadc3ffdd3f9@amd.com/
>
> I am just waiting for some feedback before sending a v2.

Looking closer, the pdev_mask is only set to ACP63_PDM_DEV_MASK so the 
case statement can be folded into the above if-check of pdev_mask.

And the default: dropped,  it looks like dead code.

Please cc me on the v2,

Tom

>
>> ---
>>   sound/soc/amd/ps/pci-ps.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
>> index 401cfd0036be..cba8800ab4ea 100644
>> --- a/sound/soc/amd/ps/pci-ps.c
>> +++ b/sound/soc/amd/ps/pci-ps.c
>> @@ -205,8 +205,7 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>>   		memset(&pdevinfo, 0, sizeof(pdevinfo));
>>   	}
>>   
>> -	switch (adata->pdev_mask) {
>> -	case ACP63_PDM_DEV_MASK:
>> +	if (adata->pdev_mask == ACP63_PDM_DEV_MASK) {
>>   		adata->pdm_dev_index  = 0;
>>   		acp63_fill_platform_dev_info(&pdevinfo[0], parent, NULL, "acp_ps_pdm_dma",
>>   					     0, adata->res, 1, NULL, 0);
>> @@ -214,8 +213,8 @@ static int create_acp63_platform_devs(struct pci_dev *pci, struct acp63_dev_data
>>   					     0, NULL, 0, NULL, 0);
>>   		acp63_fill_platform_dev_info(&pdevinfo[2], parent, NULL, "acp_ps_mach",
>>   					     0, NULL, 0, NULL, 0);
>> -		break;
>> -	default:
>> +	} else {
>> +		ret = -ENODEV;
>>   		dev_dbg(&pci->dev, "No PDM devices found\n");
>>   		goto de_init;
>>   	}
>> -- 
>> 2.27.0
>>
>>

