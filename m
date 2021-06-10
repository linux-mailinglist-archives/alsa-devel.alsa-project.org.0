Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD63A2C33
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 14:58:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FF4817A8;
	Thu, 10 Jun 2021 14:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FF4817A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623329891;
	bh=wRYxBYToMOK9tKtoVUSA/5QQUyNuNg0OCVNz/qfUp4c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gMm4H3201gVP7BQ1Uyw4FWRpYr4DlO47G16WndlHmdQZbEAQFsO0vKks6nhrtnbFq
	 YXvhXb8geN2p7XJv5kFMv1dc4xrugi+DyYYO2WTT6HQkyFXvAU+oJZ1lZzixMkuYg1
	 pCruFMLsrPXPKTvL92WRKmi2JIyQ8+deCXvY66Q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76B32F80227;
	Thu, 10 Jun 2021 14:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBDDCF80218; Thu, 10 Jun 2021 14:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7870EF801EC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 14:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7870EF801EC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623329798297422886-webhooks-bot@alsa-project.org>
References: <1623329798297422886-webhooks-bot@alsa-project.org>
Subject: pulseaudio can't load configuration for snd_hda_intel
Message-Id: <20210610125640.EBDDCF80218@alsa1.perex.cz>
Date: Thu, 10 Jun 2021 14:56:40 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #99 was edited from hzhuang1:

In v1.2.2, the content of HDA-Intel.conf is in below. v1.2.2 is widely used, such as in ubuntu 20.04.

```
Syntax 3
  
Define.Use ""  # a non-empty string to use UCM configuration for HDA devices

Define.AcpCardId "$${CardIdByName:acp}"
```
With this content, pulseaudio can't load configuration from UCM. Then I tried to edit the content. Change it to
```
Define.Use "2"
```
or
```
Define.Use "3"
```
Pulseaudio worked with "options snd-hda-intel probe_mask=1" on DELL laptop.

My question is what's the real meaning of **Define.Use** at here. Why the default value of **Define.Use** is empty string? Even in latest code, the **Define.Use** is also an empty string.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/99
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
