Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E13DA99EEAE
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 16:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11915AE8;
	Tue, 15 Oct 2024 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11915AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729001141;
	bh=CwEB5XtDFnR2xR93ahk4Ph7tnnttm3W76fYKiIZ+8po=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mhnuAaPFS9qjUr2BLUENstHu7I1M1GgoVv0rT/w2m0Gxhee6h8OSxgem0rkw3IEmV
	 6wZQipQXA01O8Uj1l+8zZpExfHMsgMeqIZQXKoNpiK3OZbnNOsiFCKTAa9jlSv2lY/
	 Kok3M1kp2ZS9gVIv/MbEzNsYT71PgKQHLxrzKfXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02EADF805B5; Tue, 15 Oct 2024 16:05:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2414F805B2;
	Tue, 15 Oct 2024 16:05:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E081EF80448; Tue, 15 Oct 2024 16:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BAED4F800ED
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 16:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAED4F800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1729001100175598145-webhooks-bot@alsa-project.org>
References: <1729001100175598145-webhooks-bot@alsa-project.org>
Subject: ucm-validator verify fails when including codecs/hda/hdmi.conf
Message-Id: <20241015140502.E081EF80448@alsa1.perex.cz>
Date: Tue, 15 Oct 2024 16:05:02 +0200 (CEST)
Message-ID-Hash: LI6T2IW65DT3HFJGJZITOH5ZLEVWAD7Q
X-Message-ID-Hash: LI6T2IW65DT3HFJGJZITOH5ZLEVWAD7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LI6T2IW65DT3HFJGJZITOH5ZLEVWAD7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #451 was opened from ChrisLane:

After increasing the verbosity of the validator in the GitHub workflow, we can see that the "Validate Syntax" step is failing on the `codecs/hda/hdmi.conf` file.

Here is the relevant output: https://github.com/alsa-project/alsa-ucm-conf/actions/runs/11346809053/job/31556723007#step:6:234

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/451
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
