Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 458C15502CC
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 06:25:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2FF11F42;
	Sat, 18 Jun 2022 06:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2FF11F42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655526325;
	bh=IKiKlCwSJ7S5uChiw8gF6MzXXR873sI0ZBM1kj6J7RA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTCsSxBVorfYXc4nUDywhEiakBMBVdcJa5B2UEJvA9UmQUAXqnSbgE3xufEgHpM7s
	 MMWwWJQ5Razrl9csyTzXT5Fgrimb48FDFWU4+K8kwNCjnWdNn9A+VZEkgfLZfcH7C/
	 ZMC6iGsZDKsWvi7qo4K60IU/K1EYGEpLd9I0IlWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58D11F800C7;
	Sat, 18 Jun 2022 06:24:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C77FF8026D; Sat, 18 Jun 2022 06:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CA62DF80245
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 06:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA62DF80245
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655526261252573967-webhooks-bot@alsa-project.org>
References: <1655526261252573967-webhooks-bot@alsa-project.org>
Subject: MPG X570S EDGE MAX WIFI compatibility
Message-Id: <20220618042425.2C77FF8026D@alsa1.perex.cz>
Date: Sat, 18 Jun 2022 06:24:25 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #172 was edited from yhojann-cl:

Please, add `0db0:151f` to `realtek-alc4080` chip compatibility in MPG X570S EDGE MAX WIFI motherboard:

```
$ lsusb | grep 0db0
Bus 001 Device 003: ID 0db0:151f Micro Star International USB Audio
```

In `ucm2/USB-Audio/USB-Audio.conf` add `151f` to regex of `0db0`:

```
Regex "USB((0b05:(1996|1a2[07]))|(0db0:(1feb|419c|a073|151f)))"
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/172
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
