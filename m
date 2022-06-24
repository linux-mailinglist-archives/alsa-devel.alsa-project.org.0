Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7120B55A2C4
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 22:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A14A1699;
	Fri, 24 Jun 2022 22:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A14A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656102861;
	bh=c8/+csJat+49jOnpxxwaaYn2eEL87KYIaQX+gYEyrU4=;
	h=Date:From:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s9qIXK2T2iBM34PJp6HjYECmcmRnnBUTQaMphFfFQEbkJA4mVEQ7lQ8+U7+pRnQ59
	 JRwn64biwlY5FVl+Ilq6NpenHDl03Y69tp/9J/WecY10nzqr07PH3b0skAusV88lXs
	 rRyxWbRnbFdGESDEWZdZFgxHbST2L8Y5bIwJj+sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72B63F80165;
	Fri, 24 Jun 2022 22:33:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECDF1F80139; Fri, 24 Jun 2022 22:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94882F80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 22:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94882F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.b="hKAcRbVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1656102790; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:in-reply-to:
 references; bh=kj4Fwuif2cODOXbKkmYCV+SMHIU8KTDy09L1f6UPQrQ=;
 b=hKAcRbVzlJmR8YcedyqwYSGiQQISt7H3CKUUWMWf4n1YTZz58FrcB7H6KtDpcCLDF0LdFZ
 h7jPARNXpf+9m76a8VxzAq7uPouphTMIpIpgwz4stnZ2C+MNb2SxY4xpy6rhQU/mnWMk3c
 w6hdNE8tYk6Yrf5vBKNx6dPOPee7rJU=
Date: Fri, 24 Jun 2022 21:33:01 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Questions about driver implementation (1 I2S controller to 2 codecs)
To: alsa-devel@alsa-project.org
Message-Id: <1310ER.AOPVK6422Q8P1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Christophe Branchereau <cbranchereau@gmail.com>
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

Hi,

I'm trying to add support for a new board that uses the Ingenic JZ4770 
SoC.

This SoC has a I2S/AC97 controller, and has an internal codec. The 
controller has a register switch to select either the internal codec, 
or an external codec; both cannot be enabled at the same time.

On this board, the external speakers / audio line are wired to the 
internal codec, while a HDMI chip (ITE66121) is wired as the external 
codec.

I'm having a hard time trying to figure out how the codec selection 
switch should be exported. Should it be a regular widget, and the user 
is responsible for selecting the right codec? Should it be a DAPM, and 
plugging the HDMI cable auto-enables the switch? Is this configuration 
(one controller to two codecs) already somehow supported by ALSA?

Right now we're using a "simple-audio-card" in the device tree, and 
trying to add HDMI sound support. I am not even sure if we should be 
using one sound card with the two codecs, or one sound card per codec, 
sharing the same I2S controller?

Any thoughts?

Thanks,
-Paul


