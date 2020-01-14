Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9935813AA61
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:13:27 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3107E2B2E;
	Tue, 14 Jan 2020 04:52:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3107E2B2E
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4305DF80171;
	Tue, 14 Jan 2020 04:51:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBA18F8014E; Tue, 14 Jan 2020 04:51:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 48375F80121
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 04:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48375F80121
MIME-Version: 1.0
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1578973876973015070-webhooks-bot@alsa-project.org>
References: <1578973876973015070-webhooks-bot@alsa-project.org>
Message-Id: <20200114035123.DBA18F8014E@alsa1.perex.cz>
Date: Tue, 14 Jan 2020 04:51:21 +0100 (CET)
Subject: [alsa-devel] MIDI 2.0 universal packet protocol
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #24 was edited from symdeb:

Since MIDI 2.0 only support USB and not over DIN (for now), will MIDI 2.0 need a new or updated OS class driver for the 32/64 bit universal packet interface and device descriptor for devices ? Page 16 of the USB MIDI class driver spec defines support for 1,2 or 3 bytes transfers only, How will this have to be implemented by MIDI USB device manufacturers and well as on the Linux OSes side ?  How will this impact Linux ALSA ? Would the first byte of the message with b7=0 not confuse the driver of running status ? 
Link universal packet format 
https://www.midi.org/articles-old/details-about-midi-2-0-midi-ci-profiles-and-property-exchange)
Link first MIDI 2.0 Ready product: Roland A-88MKII
https://www.midi.org/articles-old/roland-announces

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/24
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
