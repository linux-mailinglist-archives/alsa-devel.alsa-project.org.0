Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E9AEEC7D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jul 2025 04:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 842FB601DB;
	Tue,  1 Jul 2025 04:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 842FB601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751337591;
	bh=03nr4m0idUsL/Hig1Y6tjM8uHkSKtgqCRrm8PVelnyM=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Y4XCSKIKGgvHD4O7Pp1FmZesx9WTLwtcr67LJZRjWTMm8glBoimwaKKdGyR21o5tD
	 raeLPZftbDdF8ve5SLuj/ajLsB+CaZWBTtvo3F8fWybI5G8plbIiE8rqbj3e+/SeUb
	 33UgPrjdQizWb49yHVDTe+UmX1LorpGvRx+Zhn0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1590BF805C9; Tue,  1 Jul 2025 04:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EED95F805C0;
	Tue,  1 Jul 2025 04:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B77C1F800D2; Tue,  1 Jul 2025 04:39:15 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id AA448F800D2
	for <alsa-devel@alsa-project.org>; Tue,  1 Jul 2025 04:39:15 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: Request for help: Outputting audio as an I2S stream
From: tixij91670@exitbit.com
To: alsa-devel@alsa-project.org
Date: Tue, 01 Jul 2025 02:39:15 -0000
Message-ID: 
 <175133755567.22.13780534277180153752@mailman-web.alsa-project.org>
In-Reply-To: 
 <IA1PR15MB60081D218357B06E8C33F01BB567A@IA1PR15MB6008.namprd15.prod.outlook.com>
References: 
 <IA1PR15MB60081D218357B06E8C33F01BB567A@IA1PR15MB6008.namprd15.prod.outlook.com>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 2M4R22OY5QMADBUYW6DVWJVOYQS4G33G
X-Message-ID-Hash: 2M4R22OY5QMADBUYW6DVWJVOYQS4G33G
X-MailFrom: tixij91670@exitbit.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P25FXN4RSL7ICZFPJSV5SSV2JS3NOIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I totally get your frustration—deferred probes can be really cryptic to debug, especially with so little info to go on in the logs. The "deferred probe pending" message usually means a dependency for your simple-sound-card hasn't loaded yet (like a missing clock, regulator, or maybe the I2S controller driver itself).  https://googlebaseball.io
