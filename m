Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C408E14C31A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 23:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABFC1672;
	Tue, 28 Jan 2020 23:41:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABFC1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580251329;
	bh=01KtimzomGVCvOy8F4OXuLAVQHzy2ZMbEFo+xpVR8ZQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZIjYgBVB+MBccMmQeYuLfOVQ1PjnH9oSfo1hJy6khta5iHd7a7UYWPGu3GFQ/2CT
	 uQnhdJX1JMpzLcc8Hv0051nnsTndtTKLiDS1XkWgVcQwfSzsaq8YaFWXJB6XOWKN3O
	 9xVv4a9yIWWPCWAValLQDf3fpBiLqVxqgKmjhLuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61006F80082;
	Tue, 28 Jan 2020 23:40:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A9FF80150; Tue, 28 Jan 2020 23:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BABB4F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 23:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABB4F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JwcDQr5H"
Received: by mail-ed1-x541.google.com with SMTP id g19so12219491eds.11
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 14:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2tfcV4CP2sbf7T/W7OGLDgrmyx/flLregwSFl0rBGJY=;
 b=JwcDQr5HMLCngjCO/tSNT8Lj+zu3HvGpcfIH137EjhBwP51w0GaUzsAPchhJILO5Au
 /gdzBxmfsLmWwGFz1zIG1LGjJERooWfIeI1WqrgTUEu/740ajDElLhCnLGm7u3lIqJDg
 ZVAwkG474KZUGn1QvJRW2kM40mwaMW3Bq32UsN/hcQHI3p6lW0RurDDo7GN0SETJWfE/
 cWs6cBAmFGUbZy0X7dAIcpQlnfHutghmz+Y3LG+DV8cANCU8s4umLl/KBobaDlXOvL+c
 Ms4JlU7LYen8lc6dpihzPLDBP66noDG8nwZy6kT65f3fafxlqaPkVj7QD7eC9raJ7+Jm
 TbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2tfcV4CP2sbf7T/W7OGLDgrmyx/flLregwSFl0rBGJY=;
 b=k0Fh+uU25qqPTylQicTBHLeZ/oGtObNpG5lzbvRnrmxMODakkhR7ojpC0YXf5H6Per
 dTCDwxhQI40U2YyW+VjxDWktMa4MvBWOgjt62kAKcbwWveYf4XHESLtzJMfzX7xaae+C
 jAaEkBI7b9pyZlErJBlHqG96CeJhN6zjH6GOLWd+z4Pms3hFdr3kH8UfMFT66QkAO1ha
 O4aM10smdFo+rsYu5qpO24XzmS20901kS36BZ6bLDlkLo0zm58gorg+dy/AVkywfFL+Y
 hq0dJ3gIQxkkqfWd2xFTGMWuciS3QHARStxSSZnOSLp3y1xTCHRbRiXB9ipybb1WcKuj
 mvfw==
X-Gm-Message-State: APjAAAX6C4cqP4pOSASd8pJi5T7fzoJa+6MsXdN92RZFLppYhqm2dVJg
 m2VjutMNNNklCiWE6Ovh53A=
X-Google-Smtp-Source: APXvYqwkTm6HP0VazhnHwh0Fs/tM30jSvUf0/TxYtGpxSY/EOEq2DlLHwxNWmLPEJeRuUY82vXlHdQ==
X-Received: by 2002:a05:6402:153:: with SMTP id
 s19mr5393125edu.149.1580251222576; 
 Tue, 28 Jan 2020 14:40:22 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id i19sm550907edy.46.2020.01.28.14.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 14:40:21 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
 <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
 <a8409b81-7c6b-37a9-81fd-772eb2eca185@nvidia.com>
 <229def08-6bd4-30d7-056b-92329e48c699@gmail.com>
 <34917b2d-064f-44a9-4548-ae857e8ea29b@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a3173927-30f7-3957-4dda-bbb662f1ce31@gmail.com>
Date: Wed, 29 Jan 2020 01:40:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <34917b2d-064f-44a9-4548-ae857e8ea29b@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
 programming
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

MjcuMDEuMjAyMCAwODoxMSwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gVGhhbmtzIERtaXRy
eS4gSG93ZXZlciBJIHBsYW4gdG8gc2VuZCBUZWdyYTMwIHJlbGF0ZWQgcGF0Y2ggc2VwYXJhdGVs
eS4KCkZlZWwgZnJlZSB0byBhZGQgbWUgdG8gdGhlIGVtYWlsJ3MgQ0MgaWYgeW91J2xsIG5lZWQg
dG8gdGVzdCBvciByZXZpZXcKYW55dGhpbmcgcmVsYXRlZCB0byB0aGUgVDIwLzMwLgoKPiBJbiB0
aGlzIHNlcmllcyBJIHdpbGwgZm9jdXMgb24gVGVncmEyMTAgYW5kIGxhdGVyLgoKUGxlYXNlIGJl
IG1vcmUgY2FyZWZ1bCBuZXh0IHRpbWUgYW5kIHRyeSBub3QgdG8gYnJlYWsgdGhlIGV4aXN0aW5n
CmZ1bmN0aW9uYWxpdHksIGxvb2tpbmcgZm9yd2FyZCB0byB2MiA6KQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApB
bHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
