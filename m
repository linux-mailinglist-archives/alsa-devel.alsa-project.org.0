Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4550802C2F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51FC2BC0;
	Mon,  4 Dec 2023 08:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51FC2BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675517;
	bh=CMSZpQ/7L5iMSW42NrW3uM9uNb7ouZrngzngU6dndBY=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VfS5pIE7PI7nbYZZfY5JDscNJhUbCyf81DM5xLSUGQ28c1pPttNEVrro+yKyEzhV0
	 l7wmveq86zLzvkYC8KolBZltwl0bpzNDKRSVImcQBvp9x0b9twrBrh7g4y7Nq2ACeo
	 9AtPDydppfaMr7bO+BpCiLZpcQtjHMmJ7zBfmsq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA8BF805F7; Mon,  4 Dec 2023 08:37:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D93FDF805E4;
	Mon,  4 Dec 2023 08:37:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA50F8016E; Mon, 27 Nov 2023 16:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.livemail.co.uk (smtp-out-60.livemail.co.uk
 [213.171.216.60])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20370F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20370F8007E
Received: from laptop (host-78-146-56-151.as13285.net [78.146.56.151])
	(Authenticated sender: malcolm@5harts.com)
	by smtp.livemail.co.uk (Postfix) with ESMTPSA id 8A24EC5A54;
	Mon, 27 Nov 2023 15:46:25 +0000 (GMT)
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk> <87leajgqz1.fsf@5harts.com>
 <08590a87-e10c-4d05-9c4f-39d170a17832@amd.com>
User-agent: mu4e 1.8.15; emacs 29.1
From: Malcolm Hart <malcolm@5harts.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mark Brown <broonie@kernel.org>, Sven Frotscher
 <sven.frotscher@gmail.com>, git@augustwikerfors.se,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Date: Mon, 27 Nov 2023 15:44:37 +0000
In-reply-to: <08590a87-e10c-4d05-9c4f-39d170a17832@amd.com>
Message-ID: <87h6l72o8f.fsf@5harts.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: malcolm@5harts.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KKNWSV3NXYJBN2DG4ZYQ4246FIC4PPTR
X-Message-ID-Hash: KKNWSV3NXYJBN2DG4ZYQ4246FIC4PPTR
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:34:32 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKNWSV3NXYJBN2DG4ZYQ4246FIC4PPTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



>From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00 2001
From: foolishhart <62256078+foolishhart@users.noreply.github.com>
Date: Mon, 27 Nov 2023 11:51:04 +0000
Subject: [PATCH] Update acp6x-mach.c

Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to enable microphone array on ASUS Vivobook GO 15.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 15a864dcd7bd3a..3babb17a56bb55 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -283,6 +283,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "E1504FA"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {



Signed-off-by: Malcolm Hart <malcolm@5harts.com>





Mario Limonciello <mario.limonciello@amd.com> writes:

> On 11/27/2023 09:23, Malcolm Hart wrote:
>>  From da1e023a39987c1bc2d5b27ecf659d61d9a4724c Mon Sep 17 00:00:00
>> 2001
>> From: foolishhart <62256078+foolishhart@users.noreply.github.com>
>> Date: Mon, 27 Nov 2023 11:51:04 +0000
>> Subject: [PATCH] Update acp6x-mach.c
>> Added 	ASUSTeK COMPUTER INC  "E1504FA" to quirks file to
>> enable microphone array on ASUS Vivobook GO 15.
>
> You're missing a Signed-off-by: tag.
> Also as this should be going to stable you should have a tag for:
>
> Cc: stable@vger.kernel.org
>
>> ---
>>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>> diff --git a/sound/soc/amd/yc/acp6x-mach.c
>> b/sound/soc/amd/yc/acp6x-mach.c
>> index 15a864dcd7bd3a..3babb17a56bb55 100644
>> --- a/sound/soc/amd/yc/acp6x-mach.c
>> +++ b/sound/soc/amd/yc/acp6x-mach.c
>> @@ -283,6 +283,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "M6500RC"),
>>   		}
>>   	},
>> +	{
>> +		.driver_data = &acp6x_card,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "E1504FA"),
>> +		}
>> +	},
>>   	{
>>   		.driver_data = &acp6x_card,
>>   		.matches = {
>> Mark Brown <broonie@kernel.org> writes:
>> 
>>> [[PGP Signed Part:Undecided]]
>>> On Mon, Nov 27, 2023 at 12:24:59PM +0000, Malcolm Hart wrote:
>>>> Like other ASUS models the Asus Vivobook E1504FA requires an entry in
>>>> the quirk list to enable the internal microphone.
>>>>
>>>> Showing
>>>> with 7 additions and 0 deletions.
>>>> 7 changes: 7 additions & 0 deletions 7
>>>> sound/soc/amd/yc/acp6x-mach.c
>>>> @@ -283,6 +283,13 @@ static const struct dmi_system_id
>>>> yc_acp_quirk_table[] = {
>>>
>>> The patch appears to have been unusably corrupted by your e-mail
>>> software and is also missing a Signed-off-by.  See email-cleints.rst for
>>> some suggestions on configuring things, or it might be worth looking
>>> into b4 and it's web submission endpoint:
>>>
>>>     https://b4.docs.kernel.org/en/latest/
>>>
>>> [[End of PGP Signed Part]]
>> 

