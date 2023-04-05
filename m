Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C28236D87FE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:14:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3874D1FA;
	Wed,  5 Apr 2023 22:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3874D1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725695;
	bh=InuCaPx3GCjuhQyeDWDyKUlj11ciHaCHdtc9ogRQyCE=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RCr4g9oiahgGtFx+Q7hY/Vf5WQ+zyhxmF18p50H3Yz5DcfSvC4MYZl1XeJHlgRxRB
	 /P3C+ibWVS3kWvAjsG8s97GRYnyDf2+rODI9A6iEWawGSINmIbP+HzPCbyXHmrgRyy
	 FlR8HCPP0wQQEmAiGdR/nKmzLxNh67nCSgbiCQbo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 502F3F80495;
	Wed,  5 Apr 2023 22:12:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F9CBF80495; Wed,  5 Apr 2023 22:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16CACF80495
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CACF80495
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 7DF8524255
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:20 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-DlJ-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] docs: sound: hda: drop mentions of hda-analyzer
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197848-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: USGIYS4T226CEBD6H75SE72GTN4V55KA
X-Message-ID-Hash: USGIYS4T226CEBD6H75SE72GTN4V55KA
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USGIYS4T226CEBD6H75SE72GTN4V55KA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's gone from the repos, presumably because nobody ported it to
Python 3.

I'm leaving hda-emu in, even though it isn't actually usable with
current kernels (but with some minor hacking, the encoding tools work).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/hd-audio/notes.rst | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index a9e35b1f87bd..34865d3b7512 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -308,9 +308,9 @@ Direct Debugging
 ----------------
 If no model option gives you a better result, and you are a tough guy
 to fight against evil, try debugging via hitting the raw HD-audio
-codec verbs to the device.  Some tools are available: hda-emu and
-hda-analyzer.  The detailed description is found in the sections
-below.  You'd need to enable hwdep for using these tools.  See "Kernel
+codec verbs to the device.  One tool is available: hda-emu.
+The detailed description is found in the section below.
+You'd need to enable hwdep for using this tool.  See the "Kernel
 Configuration" section.
 
 
@@ -339,7 +339,7 @@ When this is enabled, the driver creates hardware-dependent devices
 (one per each codec), and you have a raw access to the device via
 these device files.  For example, ``hwC0D2`` will be created for the
 codec slot #2 of the first card (#0).  For debug-tools such as
-hda-verb and hda-analyzer, the hwdep device has to be enabled.
+hda-verb, the hwdep device has to be enabled.
 Thus, it'd be better to turn this on always.
 
 ``CONFIG_SND_HDA_RECONFIG`` is a new option, and this depends on the
@@ -819,22 +819,6 @@ See README file in the tarball for more details about hda-verb
 program.
 
 
-hda-analyzer
-------------
-hda-analyzer provides a graphical interface to access the raw HD-audio
-control, based on pyGTK2 binding.  It's a more powerful version of
-hda-verb.  The program gives you an easy-to-use GUI stuff for showing
-the widget information and adjusting the amp values, as well as the
-proc-compatible output.
-
-The hda-analyzer:
-
-* https://git.alsa-project.org/?p=alsa.git;a=tree;f=hda-analyzer
-
-is a part of alsa.git repository in alsa-project.org:
-
-* git://git.alsa-project.org/alsa.git
-
 Codecgraph
 ----------
 Codecgraph is a utility program to generate a graph and visualizes the
-- 
2.40.0.152.g15d061e6df

