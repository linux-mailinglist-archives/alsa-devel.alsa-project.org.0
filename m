Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C32234B38
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 20:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77F671663;
	Fri, 31 Jul 2020 20:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77F671663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596220689;
	bh=IXiwq/UhVw/NFzE8dXR5aLW7vqF/+8PhiP8Hnpooyf0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=hGPro46p1SFwBI6/GqlD/ytjqoFti/OMW59Bea+WYywhA5QqOGTHJQzwODBDezqTT
	 8SshXFzuSh8iUhZ0mvUexiK1fSW7YZNLZW8/kVeSp4Q0XCDIq7ks1sYRB9LSaN3vZo
	 txrxV8ESRR9rXg5tBcLYvfuEpBHd0l9hWm6rZX2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A2DF80161;
	Fri, 31 Jul 2020 20:36:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56703F80171; Fri, 31 Jul 2020 20:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from schnee.saar.de (schnee.saar.de [192.109.53.243])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F309BF80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 20:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F309BF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=marzen.de header.i=@marzen.de
 header.b="bU7FNIke"
Received: from bubu.intern.marzen.de (bubu.intern.marzen.de [10.66.53.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by schnee.saar.de (Postfix) with ESMTPS id E8CF664447
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 20:36:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marzen.de; s=201902;
 t=1596220583; bh=IXiwq/UhVw/NFzE8dXR5aLW7vqF/+8PhiP8Hnpooyf0=;
 h=Date:From:Reply-To:To:Subject:From;
 b=bU7FNIkerediYCRoWiFjAP5w3OMmGQOYyaMx/6ttBASdpwm8kcQD6J8PPr6YWy7r+
 q9RO8uRBSKisuBvuElaEPRt8y6HHbvDxqh2BHQBX43Ay/vt2tRWouWrz9AGiJLZWGE
 m8Csj0KNB1QHIQQe7qu+WlN5FSLdbnC8ziwEju/w=
Date: Fri, 31 Jul 2020 20:36:22 +0200 (CEST)
From: Holger Marzen <holger@marzen.de>
X-X-Sender: hm@bubu.intern.marzen.de
To: alsa-devel@alsa-project.org
Subject: Where in sound/usb can modulo-8 channel hopping occur?
Message-ID: <alpine.DEB.2.20.2007312034200.24559@bubu.intern.marzen.de>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Reply-To: holger@marzen.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Can anyone help me to nail down occasional modulo-8 channel output
hopping in the USB audio subsystem?

Most people won't be affected by that bug because their USB audio
interface doesn't offer more than 8 channels.

Regards
Holger
