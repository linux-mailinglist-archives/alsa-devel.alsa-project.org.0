Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E649A802C2E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 08:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487DCDEC;
	Mon,  4 Dec 2023 08:38:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487DCDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701675505;
	bh=O1mau4JypPyy1TAttZ7psnBfiDM76Cr97cR93Yo8pDs=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjmSH9dYu6tYv8bE2qYGvaOa/BoudTKw/1Tu8faFQcJ3rqYgDn+x91NvtsX/NCwpv
	 yjwpgyPQdZTui6790sMyRLNFKGMv3eyEeZ5jLb7dYz5W4d5FVAzRX0kET3bYoKrPQ6
	 I++4C3HrFd5mS2VgoC/RMJWAh036MoiaUY0pf7rI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15032F805B3; Mon,  4 Dec 2023 08:37:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 439A8F80588;
	Mon,  4 Dec 2023 08:37:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA4CF80104; Mon, 27 Nov 2023 16:23:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp.livemail.co.uk (smtp-out-60.livemail.co.uk
 [213.171.216.60])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD611F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD611F80104
Received: from laptop (host-78-146-56-151.as13285.net [78.146.56.151])
	(Authenticated sender: malcolm@5harts.com)
	by smtp.livemail.co.uk (Postfix) with ESMTPSA id C6E1BC5A22;
	Mon, 27 Nov 2023 15:23:30 +0000 (GMT)
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
 <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
User-agent: mu4e 1.8.15; emacs 29.1
From: Malcolm Hart <malcolm@5harts.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Date: Mon, 27 Nov 2023 15:23:08 +0000
In-reply-to: <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
Message-ID: <87leajgqz1.fsf@5harts.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: malcolm@5harts.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: W7OIN2YRQV6R7Q7NJTEM7U4ZHY3OJHKT
X-Message-ID-Hash: W7OIN2YRQV6R7Q7NJTEM7U4ZHY3OJHKT
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:34:26 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7OIN2YRQV6R7Q7NJTEM7U4ZHY3OJHKT/>
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





Mark Brown <broonie@kernel.org> writes:

> [[PGP Signed Part:Undecided]]
> On Mon, Nov 27, 2023 at 12:24:59PM +0000, Malcolm Hart wrote:
>> Like other ASUS models the Asus Vivobook E1504FA requires an entry in
>> the quirk list to enable the internal microphone.
>> 
>> Showing
>> with 7 additions and 0 deletions.
>> 7 changes: 7 additions & 0 deletions 7
>> sound/soc/amd/yc/acp6x-mach.c
>> @@ -283,6 +283,13 @@ static const struct dmi_system_id
>> yc_acp_quirk_table[] = {
>
> The patch appears to have been unusably corrupted by your e-mail
> software and is also missing a Signed-off-by.  See email-cleints.rst for
> some suggestions on configuring things, or it might be worth looking
> into b4 and it's web submission endpoint:
>
>    https://b4.docs.kernel.org/en/latest/
>
> [[End of PGP Signed Part]]

