Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B6969876
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 11:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EE8986E;
	Tue,  3 Sep 2024 11:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EE8986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725354937;
	bh=z4t2E9hwTy84qeiTNY2XD1Kv0TgJzd9gG26X8JtzOuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ndq4Tzty72EJqrm3vSKZombbXpNAoBTesfJtYe3gSKFLocL2RJ9Dw57xNb7Pj7vIO
	 X0IKLaKy4mUyet9jydI+pO+x+Qomcg3AJ04Me5OIrQraTXnXedCUamha6s8BiAZWIT
	 /Z2Ko0hHex+bsfsQ3O1TXZl4pvoesjzQFgKruzjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41314F804F3; Tue,  3 Sep 2024 11:15:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD07F805B3;
	Tue,  3 Sep 2024 11:15:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D54F80199; Tue,  3 Sep 2024 11:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AF50F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 11:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF50F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ur8H4xtB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DB6CA4214C;
	Tue,  3 Sep 2024 09:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA49FC4CEC4;
	Tue,  3 Sep 2024 09:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725354904;
	bh=z4t2E9hwTy84qeiTNY2XD1Kv0TgJzd9gG26X8JtzOuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ur8H4xtBs3iq1aicvWJ0m5niFlo7ROgd552n6NF8d825lAi1+jRTrNXR7ErLRxXcz
	 1owOcvxCbg3LzVQn7GUDnZNHwujakatcbjyxidGPCSNlI3dfqtHZu9sCh3yyivuhfG
	 6NaILS0Di4DPVk8QT3Ah7huCZIstBZ+JFN6igh5ixcyi8LXWsipQ0ZzuxuhKOi8HuG
	 q98HxW5s0ulaKgXC0hIgeAET882lR8B69HfLpE/VOxiaTx3NwlMR9yuBozum5jqfAy
	 la592u7GyNfLCjOOaRPFzMAVvfod+5FSYVv4iUkkf8uAVdfn0lF1FvehCdZOYWPeC9
	 GLSXmeEIbZZOg==
Message-ID: <42c43114-75ce-4946-9f70-aac3cb0c1b2b@kernel.org>
Date: Tue, 3 Sep 2024 11:14:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: 
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CLXHZXY2L2IIFHBADFBSZ3RTSGX4HBLO
X-Message-ID-Hash: CLXHZXY2L2IIFHBADFBSZ3RTSGX4HBLO
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLXHZXY2L2IIFHBADFBSZ3RTSGX4HBLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/09/2024 11:08, Ki-Seok Jo wrote:
>>
>> On 03/09/2024 10:39, Ki-Seok Jo wrote:
>>>>
>>>> On Tue, Sep 03, 2024 at 02:44:34PM +0900, Kiseok Jo wrote:
>>>>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>>>>
>>>> Empty commit? Read submitting-patches.
>>>>
>>>
>>> Okay I'll add next patch.
>>>
>>>
>>>> Please run scripts/checkpatch.pl and fix reported warnings. Then
>>>> please run and (probably) fix more warnings.
>>>> Some warnings can be ignored, especially from --strict run, but the
>>>> code here looks like it needs a fix. Feel free to get in touch if the
>>>> warning is not clear.
>>>>
>>>
>>> When I checked, I didn't encounter any errors or warnings when using
>> 'checkpatch.pl'.
>>> What options might be needed?
>>
>> That's not true and I am not happy that I need to prove to you obvious thing.
>> You do not need any options. Look:
>>
>> WARNING: Missing commit description - Add an appropriate one
>>
>> You could at least now double check if reviewer pointed it out instead of
>> immediately disagreeing with review.
>>
> 
> I have no intention of opposing the content. I am asking again because I didn't receive any warnings when I did the following, and I suspect I might have done something wrong.
> 
> 
> ./scripts/checkpatch.pl Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml
> 
> total: 0 errors, 0 warnings, 54 lines checked
> 
> Documentation/devicetree/bindings/sound/irondevice,sma1307.yaml has no obvious style problems and is ready for submission.
> 
> I was under the impression that this only applied to patched files as described above. It turns out it can also be used with patch files. Thank you for the useful information!
> 

That's not how you run checkpatch. You run it on the patch. Please read
submitting-patches document. It explains everything.

Best regards,
Krzysztof

