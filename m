Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F03A53159C
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 20:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9564B16C7;
	Mon, 23 May 2022 20:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9564B16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653332173;
	bh=L0XOpO21rPTZIsbhIPJ9Aap22rYXwxENg2BV94fRIrE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eccLbYN1Di4RgWibUcvTgrb+OPcYPEPvLS/Q3OWK5lBEcygBWynWK3BKUEuk36WK0
	 nTD4eE2Ib20nEIndruZR3a7eKmjL7OYMUovVm0aZJCe2ILJpoJcyBCu2Ax6v+Lactz
	 bYz1OjqrQa6SGvd/ROLMlEzSBdCo2Oy5yHtTb9iI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F105CF8025E;
	Mon, 23 May 2022 20:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60F02F80236; Mon, 23 May 2022 20:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,WEIRD_QUOTING autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DD916F800CB
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 20:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD916F800CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653332109045311928-webhooks-bot@alsa-project.org>
References: <1653332109045311928-webhooks-bot@alsa-project.org>
Subject: amixer returns a RC=1 when you use 'amixer -v' while other 'amixer'
 commands (like 'amixer -h` or `amixer --help') return with a '0'.
Message-Id: <20220523185512.60F02F80236@alsa1.perex.cz>
Date: Mon, 23 May 2022 20:55:12 +0200 (CEST)
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

alsa-project/alsa-utils issue #149 was opened from juggledad:

amixer version 1.2.4
Raspberry Pi Zero W v1.1
Raspbian GNU/Linux 11 (bullseye) - desktop version
Node-RED v2.2.2

This was discovered using an `exec` node in  on a  The exec node runs a command and returns its output. When running a test, I wanted to get the amixer version. There are two ways to ask `amixer` for it's version number
1 - use 'amixer -v'
2 - use 'amixer --version`
Both returned the version number but had a Return Code of 1. All other 'amixer' commands (like 'amixer -h` or `amixer --help') return with a '0'.

Here is a copy of the node-red flow that was used:

`
[{"active":true,"complete":"true","console":false,"id":"38409c9414d4fb0b","name":"stdout","statusType":"auto","statusVal":"","targetType":"full","tosidebar":true,"tostatus":false,"type":"debug","wires":[],"x":730,"y":80,"z":"58ad38887591e1b1"},{"active":true,"complete":"true","console":false,"id":"de852fbd07407b7a","name":"stderr","statusType":"auto","statusVal":"","targetType":"full","tosidebar":true,"tostatus":false,"type":"debug","wires":[],"x":730,"y":120,"z":"58ad38887591e1b1"},{"active":true,"complete":"true","console":false,"id":"42faac21ce0190b3","name":"return code","statusType":"auto","statusVal":"","targetType":"full","tosidebar":true,"tostatus":false,"type":"debug","wires":[],"x":750,"y":160,"z":"58ad38887591e1b1"},{"crontab":"","id":"84f238ce5b65227d","name":"","once":false,"onceDelay":0.1,"payload":"amixer -v","payloadType":"str","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","topic":"","type":"inject","wires":[["05c0a4eb46c0c1c8"]],"x":180,"y":60,"z":"5
 8ad38887591e1b1"},{"crontab":"","id":"fabfd7b565392096","name":"","once":false,"onceDelay":0.1,"payload":"amixer -h","payloadType":"str","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","topic":"","type":"inject","wires":[["05c0a4eb46c0c1c8"]],"x":180,"y":180,"z":"58ad38887591e1b1"},{"crontab":"","id":"c54064c5cc3b2484","name":"","once":false,"onceDelay":0.1,"payload":"amixer --version","payloadType":"str","props":[{"p":"payload"},{"p":"topic","vt":"str"}],"repeat":"","topic":"","type":"inject","wires":[["05c0a4eb46c0c1c8"]],"x":200,"y":120,"z":"58ad38887591e1b1"},{"addpay":"payload","append":"","command":"","id":"05c0a4eb46c0c1c8","name":"","oldrc":false,"timer":"","type":"exec","useSpawn":"false","winHide":false,"wires":[["38409c9414d4fb0b"],["de852fbd07407b7a"],["42faac21ce0190b3"]],"x":490,"y":120,"z":"58ad38887591e1b1"}]
`

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/149
Repository URL: https://github.com/alsa-project/alsa-utils
