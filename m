Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F2D3F8C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 14:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77CDE166F;
	Fri, 11 Oct 2019 14:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77CDE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570797132;
	bh=LgTJxDjc9vHxCNAdysEyFCxjWt8JFN64GiJtxtw5BUE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8nqSC3VeLfKsV1lfbvNPGtNvAT7zXd8QDFniYXqv6MB+WEefoHc5O78qeqaWvhs9
	 JCBBjzU3XPfU+2mYFKZL86I1nCO8z0NmB7E2VxBPOmivpfwbHFAddFyBQnACtZKpUj
	 jyTMBa8W/NEDl6lSdO7e6BQ7RLzeLiFDsgvfAL44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D0BF8026F;
	Fri, 11 Oct 2019 14:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FFA7F802BE; Fri, 11 Oct 2019 14:30:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC572F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 14:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC572F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RNtV53yj"
Received: by mail-wr1-x442.google.com with SMTP id h4so11744054wrv.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eUAVKWO5tGOGok/vKm5I9Fla/1z4P3pvPIySfc1WbLY=;
 b=RNtV53yjZdIOhcHzhhnYIbDQbJJ7VLlvGAzwvvD7Iz76cQbWeEsAAgKU1UR+xBYFbD
 lTQhpVC6KvASGkVqJcSNfXZ/GTqhbSdUv8IG0CQGmGNDckpp6soaH5cLty0VtOsEsyfW
 bs5sbmKzARNsPY/zhYADlpWpebgW5RjvmCEwfBToNFd+nDMpLYY92kmn+8tnJTWP1HsO
 9BtBLlg5UjgSUmztX1EnqGaORzA7BZSjQYHtLB6/ec9ZaWSFwbAdmhjHwMFoc0acGGvq
 BmJqKwLrbeoLV3+S6GDB4j/73HchdsOTO6JU/1xHhUl5XUkjmyf0qOTNi8UQA/IDUEiv
 j2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eUAVKWO5tGOGok/vKm5I9Fla/1z4P3pvPIySfc1WbLY=;
 b=D4lt+gsNmrPCBhDbxkFi9l7dU/OpUzSnivTiGcCcwe7hBJoRqHfjGpRkl/9LgB4JrM
 b2D6lby0iR6KOQ2tXBGlU04dSM8RTP0Bq+nIGvm2fHH1b1PPyO0e8LZM7ddMyrKuMoi6
 qY7YFgREVDbPkBX6UESuCS1hw2dCVTG2/06paA4BQTWUJwONnLNhh8rO6T5WI0eGx6PQ
 AB5cf1D+ySr+CQR7uGYwml/Mboz2Jb4Zv7nvVuIG8lQSmLd+lW+93z726yqqadtquqfi
 x5s/+s9XenTvVfriu863cAbYWOX4JpT2+ygsSMxvWrPoO3p6/P1Sm9+VscJMTuVllh1u
 LOgg==
X-Gm-Message-State: APjAAAVCPwIHuC9dVg+4z7zkDjPk6jfZHfNpPEMPqOqBwnakiGpWE60F
 5qiStr27cJD9TxYT4T91mgV81g==
X-Google-Smtp-Source: APXvYqx1rdX0PmyUW4J4n+ZmiD+1KiVOhomZpcCLUgiE5LNwHT/pvqwwgRHD7MkrHSBvv4avhMCG2Q==
X-Received: by 2002:adf:f4c2:: with SMTP id h2mr13353630wrp.69.1570797021729; 
 Fri, 11 Oct 2019 05:30:21 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 t123sm14523710wma.40.2019.10.11.05.30.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 05:30:20 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
 <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
 <20191010120337.GB31391@ediswmail.ad.cirrus.com>
 <22eff3aa-dfd6-1ee5-8f22-2af492286053@linux.intel.com>
 <e671930b-645a-7ee3-6926-eea39626c0a3@linaro.org>
 <c9203f7f-f360-0ede-d351-cfdbec03299c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <dbb25f4c-7198-ef28-ec6a-9ac5676122b6@linaro.org>
Date: Fri, 11 Oct 2019 13:30:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c9203f7f-f360-0ede-d351-cfdbec03299c@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, Vinod Koul <vkoul@kernel.org>, robh+dt@kernel.org,
 Mark Brown <broonie@kernel.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAxMC8xMC8yMDE5IDE2OjQ5LCBQaWVycmUtTG91aXMgQm9zc2FydCB3cm90ZToKPiAKPiAK
Pj4gSSBzdGlsbCBuZWVkIHRvIGZpZ3VyZSBvdXQgcHJlZml4aW5nIG11bHRpcGxlIGluc3RhbmNl
cyBvZiB0aGlzIAo+PiBBbXBsaWZpZXIgY29udHJvbHMgd2l0aCAiTGVmdCIgYW5kICJSaWdodCIK
PiAKPiBGV0lXIHdlIHVzZSB0aGUgInNuZF9jb2RlY19jb25mIiBzdHVmZiB0byBhZGQgYSBwcmVm
aXggZm9yIGVhY2ggCj4gYW1wbGlmaWVyLCBzbyB0aGF0IHRoZSBjb250cm9scyBhcmUgbm90IG1p
eGVkIHVwIGJldHdlZW4gaW5zdGFuY2VzIG9mIAo+IHRoZSBzYW1lIGFtcCwgc2VlIGUuZy4KPiAK
VGhhbmtzIFBpZXJyZSBmb3IgdGhlIGlucHV0cy4KQW0gdXNpbmcgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL25hbWUtcHJlZml4LnR4dCBmb3IgZHQgCmFuZCBpdCB3b3Jr
cyEKCkkgd2lsbCBzZW5kIG5ldyBzZXQgb2YgcGF0Y2hlcyBieSBkcm9wcGluZyB0aGlzIHBhdGNo
IQoKLS1zcmluaQo+IAo+IHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19jb2RlY19jb25mIGNvZGVjX2Nv
bmZbXSA9IHsKPiAgwqDCoMKgwqB7Cj4gIMKgwqDCoMKgwqDCoMKgIC5kZXZfbmFtZSA9ICJzZHc6
MDoyNWQ6NzExOjA6MSIsCj4gIMKgwqDCoMKgwqDCoMKgIC5uYW1lX3ByZWZpeCA9ICJydDcxMSIs
Cj4gIMKgwqDCoMKgfSwKPiAgwqDCoMKgwqB7Cj4gIMKgwqDCoMKgwqDCoMKgIC5kZXZfbmFtZSA9
ICJzZHc6MToyNWQ6MTMwODowOjAiLAo+ICDCoMKgwqDCoMKgwqDCoCAubmFtZV9wcmVmaXggPSAi
cnQxMzA4LTEiLAo+ICDCoMKgwqDCoH0sCj4gIMKgwqDCoMKgewo+ICDCoMKgwqDCoMKgwqDCoCAu
ZGV2X25hbWUgPSAic2R3OjI6MjVkOjEzMDg6MDoyIiwKPiAgwqDCoMKgwqDCoMKgwqAgLm5hbWVf
cHJlZml4ID0gInJ0MTMwOC0yIiwKPiAgwqDCoMKgwqB9LAo+ICDCoMKgwqDCoHsKPiAgwqDCoMKg
wqDCoMKgwqAgLmRldl9uYW1lID0gInNkdzozOjI1ZDo3MTU6MDoxIiwKPiAgwqDCoMKgwqDCoMKg
wqAgLm5hbWVfcHJlZml4ID0gInJ0NzE1IiwKPiAgwqDCoMKgwqB9LAo+IH07Cj4gCj4gCj4gaHR0
cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC8xMTQyL2NvbW1pdHMvOWZm
OWNmOWQ4OTk0MzMzZGYyMjUwNjQxYzk1NDMxMjYxYmM2NmQ2OSNkaWZmLTg5MjU2MGY4MGQ2MDM0
MjBiYWVjNzM5NWUwYjQ1ZDgxUjIxMiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
