Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51512BB0D2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC5F17FA;
	Fri, 20 Nov 2020 17:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC5F17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605890663;
	bh=PwH+APuoJLyv528NX3V9K8rdYW/pwTr0f7Bzs7lMaCE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MGD1kJm+6l0b75MIMV+KgOTE5i4z9db3GNpBE+cN+2WGyUbf9+UwAj7Ln5yg+2EsS
	 j6vZgekN0EBXkeTs+iTfLqS8lnajIZApj6C8Bd7BTzqfkFfFS9qbCvUSvLhF2qwwlA
	 kjFxBCUnZ5OxUmA43bJiQ6iia8EN/z7ZPQg6MNNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08395F80166;
	Fri, 20 Nov 2020 17:43:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B6DF8016E; Fri, 20 Nov 2020 17:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CFCBF80168
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CFCBF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="duNB48DL"
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C160E2078B;
 Fri, 20 Nov 2020 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605890606;
 bh=PwH+APuoJLyv528NX3V9K8rdYW/pwTr0f7Bzs7lMaCE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=duNB48DL4PCS+983OUMPYfZ/Kk7QA5ODSfPmtduzzCmKf4/1e2D5Khp5aOR5IVUiL
 dQnCuzXo26BnRq8++xlGBXa21FIiQ4dnS83QEV5LVpjo9q4uIBOqa61x7Coosrey+B
 QzCPRvcsMq93n2rkF7liKqrUJU5i1PeGAKvxC2jo=
Subject: Re: [PATCH 09/38] ASoC: samsung: smdk_wm8994: drop of_match_ptr from
 of_device_id table
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120161653.445521-9-krzk@kernel.org>
From: Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <24ffbe28-2057-245e-fad4-55cedbd9ab4f@kernel.org>
Date: Fri, 20 Nov 2020 17:43:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120161653.445521-9-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>
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

On 11/20/20 17:16, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).  This fixes
> compile warning (!CONFIG_OF on x86_64):
> 
>    sound/soc/samsung/smdk_wm8994.c:139:34: warning: ‘samsung_wm8994_of_match’ defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
