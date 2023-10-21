Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E57D3989
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00BCAA4E;
	Mon, 23 Oct 2023 16:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00BCAA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698072005;
	bh=yICm6dRSai3l3BNB3f2xPBxCmxJwxpldtGL7sOQDsbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pPlqqeuT2Ra7omJYqYg3cfQWuVUM6e5bi6bw9Jpaidx451k2IU7vW3yJQJFdLotk2
	 qqyUSfrsbw5CJwImVTcMf+PGt/ImzzRci2YYHCyVbdIAvrMsuFx45QkmcEd46Rcfj7
	 EZDng8KbYNly9u3h7yKLkg1KVI99qAsdpG63wveU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE673F8057F; Mon, 23 Oct 2023 16:38:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A54F80571;
	Mon, 23 Oct 2023 16:38:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F67F8025F; Sat, 21 Oct 2023 18:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from box.trvn.ru (unknown [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F260CF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 18:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F260CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=trvn.ru header.i=@trvn.ru header.a=rsa-sha256
 header.s=mail header.b=RmvO0iEu
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 64C3141885;
	Sat, 21 Oct 2023 21:47:35 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1697906856; bh=yICm6dRSai3l3BNB3f2xPBxCmxJwxpldtGL7sOQDsbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RmvO0iEu77pUW+VBiQ6/14IhlkveueWvBgs/uAMqO8W3PHAkomMHaRlI1JAVI1NUH
	 e3/BCc9k+feKmhLqKBvrZZFMWvHXz0RClKFiy9ajs4lXoLTiELs7KTK1Tx2q7ZKO7V
	 OLY9gmYnW580+aRCxxdrR3s1pqf/g5l2jRqaRbsY1YbQqY9pAiYzMPPXkMV7tiR8g/
	 G5tmO1kZps6OU9vCI1l0y2BQF9Rda9G4FPzTNa8i9gYWzG4RRrAgM5505k0yD6Qd3h
	 brmb5wrakeSxVbpRbiwo9NqxzvsgnYP30iS0hRyUElxRyr9lN4toZMnKIP7QTkY5ks
	 aCJQ+aX25Jitg==
MIME-Version: 1.0
Date: Sat, 21 Oct 2023 21:47:34 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 jenneron@postmarketos.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] sc7180: Add qdsp baked soundcard
In-Reply-To: <ae070706-2f0a-4932-b917-b8cc9a59b46e@linaro.org>
References: <20231020-sc7180-qdsp-sndcard-v1-0-157706b7d06f@trvn.ru>
 <ae070706-2f0a-4932-b917-b8cc9a59b46e@linaro.org>
Message-ID: <2b5dfc98e82fed3d2eef9eca3912c089@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: nikita@trvn.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DTMYDMSE4YEED3W6RTW5GUYUVIZFIOGN
X-Message-ID-Hash: DTMYDMSE4YEED3W6RTW5GUYUVIZFIOGN
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:38:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTMYDMSE4YEED3W6RTW5GUYUVIZFIOGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Konrad Dybcio писал(а) 21.10.2023 21:17:
> On 10/20/23 17:33, Nikita Travkin wrote:
>> Some devices, such as Acer Aspire 1, can't use lpass dirrectly, but
>> instead must use adsp core to play sound. Since otherwise the hardware
>> is, usually, very similar across the devices on the same platform, it
>> makes sense to reuse the same boardfile.
>>
>> This series refactors the sc7180.c slightly and adds the functions to
>> control clocks via adsp instead of controlling the hardware directly.
>>
>> Existing google devices should experience no change.
>>
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
> s/baked/backed, unless it's a nice bread :)

At least I was consistent in failing to pick the correct word...

If we get to v2, I will try to remember about those, but if not,
I guess I will accept the chance, that in a couple of years I may
wake up in cold sweat upon realizing that this mistake is forever
immortalized in the Linux git history...

Thanks for noticing this!
Nikita

> 
> Konrad
