Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E794634A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 20:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B85475C;
	Fri,  2 Aug 2024 20:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B85475C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722624012;
	bh=uTZqiMGFQ/jGkRHiamEEHtPD07usskeQyvZpi4sCpv8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=W9+QqgcGk4qAfjCKYiuLX8XbgTpclUZ5kVOR2YZyT0z6tNb/C482qvVbRAIjcisQ/
	 v8Q48tKyS0FUjHgMfI9Tx3DLC3ILxe6sLAgCWxxkqVZlIe2stIl4p+a7lEoEbbhbIW
	 ozxkQN37BgcX/kkncXmgNJi47TWa5DZg7hwE5Mmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 284C7F801C0; Fri,  2 Aug 2024 20:39:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEF2BF8059F;
	Fri,  2 Aug 2024 20:39:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B3F7F80269; Fri,  2 Aug 2024 20:39:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id AEACEF800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 20:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEACEF800B0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1722623971060228348-webhooks-bot@alsa-project.org>
References: <1722623971060228348-webhooks-bot@alsa-project.org>
Subject: Soundblaster AE-5 100% Muted on alsamixer every boot!!
Message-Id: <20240802183935.8B3F7F80269@alsa1.perex.cz>
Date: Fri,  2 Aug 2024 20:39:35 +0200 (CEST)
Message-ID-Hash: 4F6VQ725HE2T4LJHKRXNIARRETFI5HK4
X-Message-ID-Hash: 4F6VQ725HE2T4LJHKRXNIARRETFI5HK4
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4F6VQ725HE2T4LJHKRXNIARRETFI5HK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #404 was opened from DavidRLTG:

I am on Linux Mint Wilma (22), 64-bit.
Obviously, I have a Soundblaster AE-5 Sound card
The issue I am encountering is, well, every boot I have to enter Alsamixer and unmute every channel on my Soundblaster AE-5.

alsactl store does nothing, and yes I ran it as superuser.
Also, I'm on pipewire! I think Wilma comes with it preinstalled.

sudo alsactl store is also temporary, the config is lost at every reboot, and doing sudo alsactl restore does nothing.

Any ideas for a fix?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/404
Repository URL: https://github.com/alsa-project/alsa-lib
