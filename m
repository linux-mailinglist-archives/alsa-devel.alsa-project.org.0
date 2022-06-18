Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFB55029A
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 06:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D34E1757;
	Sat, 18 Jun 2022 06:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D34E1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655525295;
	bh=/XKP5ggzkZriWJ8kHYXROaV58dygK8takFDj9XTNhCY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rkEIDp1hvlgCvyyQvtakUwGnRntgR7JegRhQGIC9ZYvQtUxP4DmlD0EboRE2JbjPs
	 TFZPJNUkgAd00NuIyGHfXwOYDwnKl/RIWZ8CMWBZii/W8BCPYwUOtSbHO0xOKjNcrk
	 zEdrYqP1t8/Z6XR8uog04pvRjtq9E+KREQfyb7fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E36F800C7;
	Sat, 18 Jun 2022 06:07:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BA1DF8026D; Sat, 18 Jun 2022 06:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A860BF800C7
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 06:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A860BF800C7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655525231867194891-webhooks-bot@alsa-project.org>
References: <1655525231867194891-webhooks-bot@alsa-project.org>
Subject: MPG X570S EDGE MAX WIFI compatibility
Message-Id: <20220618040715.3BA1DF8026D@alsa1.perex.cz>
Date: Sat, 18 Jun 2022 06:07:15 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #172 was opened from yhojann-cl:

Please, add `0db0:151f` to `realtek-alc4080` chip compatibility in MPG X570S EDGE MAX WIFI motherboard:

In `ucm2/USB-Audio/USB-Audio.conf` add `151f` to regex of `0db0`:

```
Regex "USB((0b05:(1996|1a2[07]))|(0db0:(1feb|419c|a073|151f)))"
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/172
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
