Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AD7A8965
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 18:26:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C357A4A;
	Wed, 20 Sep 2023 18:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C357A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695227215;
	bh=RqgySJ17ze7rLUI/SS0jzL8LN8CO1W6nlt0s4842QFI=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gNeJYtP8rowNRjVc3lIunCmBLHd+zlj1kJ1MwE91Uxz63auWaNjDZ/+XALqWo3XWO
	 DqRg+EEt6eFI2W1SwhlRIMztA+LN3cAAxtz1a+4s0aqBMmw1EJ/Ql83mSQWoxpquYA
	 U2wuayQchMFGgcreK9MlKxKQDE+EAcj1yPj6F7/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05632F8025A; Wed, 20 Sep 2023 18:25:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A5FFF801F5;
	Wed, 20 Sep 2023 18:25:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3249BF8047D; Wed, 20 Sep 2023 18:25:52 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 274FDF80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 18:25:52 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: S0ix issues and Cirrus Amp on HP Elitebook 845 G10
From: alsamail@lenielsen.de
To: alsa-devel@alsa-project.org
Date: Wed, 20 Sep 2023 16:25:52 -0000
Message-ID: <169522715215.21.8751817512777154985@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: 2HMBNGI4NPT45YZASBUUHJTQPFMIW33L
X-Message-ID-Hash: 2HMBNGI4NPT45YZASBUUHJTQPFMIW33L
X-MailFrom: alsamail@lenielsen.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2HMBNGI4NPT45YZASBUUHJTQPFMIW33L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

my HP Elitebook 845 G10 has issues with S0ix deep sleep which seem to be somehow related to the Cirrus AMP.
The following log entry appears right before the issue occurs:

2023-09-12 21:03:27,588 DEBUG:	cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed to read MBOX STS: -121
2023-09-12 21:03:27,588 DEBUG:	cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: Failed to read MBOX STS: -121


I have already asked at AMD's gitlab regarding the s0ix issues, but we could not find a solution.
See https://gitlab.freedesktop.org/drm/amd/-/issues/2808#note_2082084 for logs and different tests and kernels

OS / Kernel: Pop!_OS with 6.5 Kernel
CPU: Ryzen 7 7840U
Bios / Firmware: everything is up to date
