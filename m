Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893436E1F77
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 11:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FFA4E0F;
	Fri, 14 Apr 2023 11:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FFA4E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681465229;
	bh=Hf4h4H5YzhjoZ/QFEntiNPzISHmEDPxFjXkJJZdSM3U=;
	h=In-Reply-To:References:Date:From:To:Subject:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MbXyOBMUZeMc4B/lAfDXVTRxV7Jr4npgYJlRq3vcEeN6hVW67sr1pOmCG5pZpTbdn
	 MMVebJj/ndZvMTljSaVxXbcRsxtKQut2R2A0UHD192CoPuzKbz7B2cIATh7l892Dkq
	 KOlMzWj6uD3wrKRYi1U7YPvWE9PJ2hAJ3BZ/lZsM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F09F8025E;
	Fri, 14 Apr 2023 11:39:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27EEDF8032B; Thu, 13 Apr 2023 18:34:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78A10F800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 18:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A10F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256
 header.s=fm1 header.b=n4WaWh7D;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=g/yYmGEa
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id AFBD232008FD;
	Thu, 13 Apr 2023 12:33:54 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute5.internal (MEProxy); Thu, 13 Apr 2023 12:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1681403634; x=1681490034; bh=sc
	qSdP8ZsFrlhVSTT6piR67Y1qxvg+wO3bZF9SXt/TM=; b=n4WaWh7DOuZ9V/nVi7
	1Dbi/LyvYDUJkQ9OJi3RshemYIXAAN0we6ZepsxjRh/CZe4AfGJeesr+RLfAfMK7
	xApte/TDdtFBy8liSmjms4khF/H4dTSp2nR6TM9pk0+BGvPJp9j+1BZCAtIMQP6e
	qDeq2NZ4rkvqjBTB2vKbN+tSJwKKvOLOsc9eJBMH+dTSnimBC7cVdGu3DwiznGen
	TzUt6EHsmC9Enau8sTnJlJ8iy0MSnMLii5nNlrFVGOyj8lvB3V6L+eGJHG4BBIaV
	btjleYID9dMXJrvjRYGNr06m/joHA0YGdBz8S99nJLny5bsl9f2A7dJQQ5YTzVa3
	6vkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681403634; x=1681490034; bh=scqSdP8ZsFrlh
	VSTT6piR67Y1qxvg+wO3bZF9SXt/TM=; b=g/yYmGEajNY6IQq1TfE5aSOtXNVEv
	6a0+1c+YasXOIfiFDSayfBd8cU6gPLVgUAsDaS3ZeFaVFcfnuXTXdnuuPZVVrEG9
	JFc/Beu16dRN5XlfiV5yq89OydCq8tz4Ardks0g2zcufv4ZO4AtUHRhucV03BWIK
	i4feYb2b7Gf0B9tPMSV1LNI0Cnw8Ri2TMaraSznoeDMymcJmjRgpl8laOKindAtF
	4VOwYpRY5ZZru3qhM971Zu4+KbOnBv72bgfFlnpmQQArkebu3MAn9s/p8GFmQr7L
	L2JBqy70RcRurQt2Fa3loHi0G41OibOsL4hKBS9536AxoMkmD5YQ7lx+w==
X-ME-Sender: <xms:8S44ZKbC2Ljqpqwv5kK-ce0K9feDLPNJkbWMvXtNMoqTVmO2Wt4T1g>
    <xme:8S44ZNYgKiBlc6RRvf2h0ti208-N4RZdQX9Z6F8sR1NrO5OYG5pwKY6W_wt-8sTqV
    lCzSSpQkSYBBvT7dZA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdekkedguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeefkeefudevveeutdeitdekffevudegkefgheej
    feeileehhfetkeekgeehvdegheenucffohhmrghinhepphhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghr
    shhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:8S44ZE-XGFzg0M3vTmIhvCPf6l6QmlZwO0EdqU5inaNK7x1Hxs1W-w>
    <xmx:8S44ZMrSIJJTJtUdDr3_Y9_S8RAS505yLuIHpiBQlRlFq6um7xHAQw>
    <xmx:8S44ZFoA12_A5l5-c-S5TXJcOC3LX1DjCcZyCDSGF1mFtl7Y1RK3ZQ>
    <xmx:8i44ZM3-u6MxvVbMO56KEitLoqienJBbc6oB-ORu4dF6MJh2Irhe4w>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BFFD2C60091; Thu, 13 Apr 2023 12:33:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <c6a91f32-8c6c-4a39-95d8-ef5c031953ab@app.fastmail.com>
In-Reply-To: 
 <MN0PR12MB61013DABE036B5D1BB3518A5E29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: 
 <OS3P286MB1711DD6556284B69C79C0C4FE19B9@OS3P286MB1711.JPNP286.PROD.OUTLOOK.COM>
 <MN0PR12MB61013DABE036B5D1BB3518A5E29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
Date: Thu, 13 Apr 2023 12:33:30 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Baishan Jiang" <bjiang400@outlook.com>, "Mark Brown" <broonie@kernel.org>,
 "Takashi Iwai" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
 for
 acp6x
Content-Type: text/plain
X-MailFrom: mpearson-lenovo@squebb.ca
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BC4QLK6MGTVCVYN7ZVKC7SBTFFUZJ3V3
X-Message-ID-Hash: BC4QLK6MGTVCVYN7ZVKC7SBTFFUZJ3V3
X-Mailman-Approved-At: Fri, 14 Apr 2023 09:39:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BC4QLK6MGTVCVYN7ZVKC7SBTFFUZJ3V3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, Apr 12, 2023, at 10:47 AM, Limonciello, Mario wrote:
> [Public]
>
> Loop Mark Pearson from Lenovo for awareness.
>
>> -----Original Message-----
>> From: Baishan Jiang <bjiang400@outlook.com>
>> Sent: Wednesday, April 12, 2023 03:41
>> To: Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>;
>> Limonciello, Mario <Mario.Limonciello@amd.com>; alsa-devel@alsa-
>> project.org
>> Cc: Baishan Jiang <bjiang400@outlook.com>
>> Subject: [PATCH v2] ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list
>> for acp6x
>> 
>> ThinkBook 14 G5+ ARP uses Ryzen 7735H processor, and has the same
>> microphone problem as ThinkBook 14 G4+ ARA.
>> 
>> Adding 21HY to acp6x quirks table enables microphone for ThinkBook
>> 14 G5+ ARP.
>> 
>> Signed-off-by: Baishan Jiang <bjiang400@outlook.com>
>
> It would be generally preferred for systems to start including the _DSD in the
> BIOS so we can stop growing the quirk list, but if they don't then patches like
> this make sense.

Ack. I've forwarded to the FW team. Internal ticket is LO-2404.

Realistically though - I'd recommend still carrying on with the patch. This platform isn't in the Linux program and it could take me a while to see if I can get them to accept making changes I'm afraid.

Mark

>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>
>> ---
>> V1 -> V2: Fixed signed-off-by format
>> ---
>>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-
>> mach.c
>> index 0acdf0156f07..62d8a8e060d2 100644
>> --- a/sound/soc/amd/yc/acp6x-mach.c
>> +++ b/sound/soc/amd/yc/acp6x-mach.c
>> @@ -178,6 +178,13 @@ static const struct dmi_system_id
>> yc_acp_quirk_table[] = {
>>  			DMI_MATCH(DMI_PRODUCT_NAME, "21EN"),
>>  		}
>>  	},
>> +	{
>> +		.driver_data = &acp6x_card,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
>> +		}
>> +	},
>>  	{
>>  		.driver_data = &acp6x_card,
>>  		.matches = {
>> --
>> 2.40.0
