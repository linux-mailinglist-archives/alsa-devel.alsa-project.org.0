Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6806E559075
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 06:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 084A518BC;
	Fri, 24 Jun 2022 06:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 084A518BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656046206;
	bh=FKIO2KZ1kWItvUN36zQ78g/YKi6gFL6l6kJ1x7m/tzU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gg0ucdnuTQC7rRFKvk6df4exHND7hEm+wBqXqTxuBTVNOQvAM6pvz9c7tNBVOjmM1
	 gcN+TCr2hbzRX3EkU7mhjST+Hlkk2voq3fjQft6wsHWKCR3OeYq6X8m8ZlCaQidPvk
	 T7WwxNa3qa0fUhK10okqsv4PoO9Cy0AZIUqLTs40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 046ECF802BE;
	Fri, 24 Jun 2022 06:49:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D72EF80246; Fri, 24 Jun 2022 06:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 25189F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 06:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25189F80109
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656046142667100906-webhooks-bot@alsa-project.org>
References: <1656046142667100906-webhooks-bot@alsa-project.org>
Subject: UCM for Behringer UMC204HD broken
Message-Id: <20220624044909.8D72EF80246@alsa1.perex.cz>
Date: Fri, 24 Jun 2022 06:49:09 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #177 was edited from gregory112:

This is related: [https://github.com/alsa-project/alsa-ucm-conf/pull/128](https://github.com/alsa-project/alsa-ucm-conf/pull/128).
I came from this issue I filed in Pipewire: [https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2471](https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2471).

So previously a while back, Behringer UMC204HD was detected as a single stereo input channel. This sound card has two inputs. However, just recently, the channel was separated into two mono channels, which was perfect. However, with the most recent update (I don't know if it's pipewire, pipewire-alsa, alsa-card-profiles, or alsa-ucm), it reverted back into the stereo single input (left/right) mode. What can I do to bring back the previous correct settings (apart from the bugs I filed in Pipewire)? I did not modify any ALSA UCM files.

Previously, a while back: it is detected as UMC204HD 192k (stereo input).
Then: UMC204HD 192k Line 1 (mono) and UMC204HD 192k Line 2 (mono) (this is how it's supposed to be, I think it's from the pull request above).
Now: Back to UMC204HD 192k (stereo input).

Might also be helpful but I am using pipewire. This is the output of `alsaucm listcards`:
```
ALSA lib ucm_subs.c:799:(uc_mgr_get_substituted_value) variable '${var:DirectCardName}' is not defined in this context!
ALSA lib main.c:1541:(snd_use_case_mgr_open) error: failed to import hw:2 use case configuration -22
ALSA lib parser.c:2957:(uc_mgr_scan_master_configs) Unable to open '-hw:2': Invalid argument
alsaucm: error failed to get card list: Invalid argument
```

There is an error for hw:2, which I assume is the Behringer. Here is the result of `alsaucm -chw:2 dump text`.
```
ALSA lib ucm_subs.c:799:(uc_mgr_get_substituted_value) variable '${var:DirectCardName}' is not defined in this context!
ALSA lib main.c:1541:(snd_use_case_mgr_open) error: failed to import hw:2 use case configuration -22
alsaucm: error failed to open sound card hw:2: Invalid argument
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/177
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
