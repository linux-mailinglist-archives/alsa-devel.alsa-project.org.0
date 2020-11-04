Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9D2A6A0A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 17:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C921686;
	Wed,  4 Nov 2020 17:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C921686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604508091;
	bh=zFr1vogUyEO6T3/hic1yln7vOBJ/TAM5DBsPrLLYhTk=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=o9CGsl3r1tqIDXHPhMzGkG5YCPHBqrJzjFQjJIQQyR8WKqruN9AFsVfWUc1Oek7LT
	 D0xkdWDrCVuIivdnCh6ZZu5HWtO20MSWr1Q5w4vao0CrqiwCx5tTWksqRoV3rU+fAP
	 Mc1ku9GXXDZwdiIIpFzp5BaXZNfVYSQ09H9Mecn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97C2EF8023E;
	Wed,  4 Nov 2020 17:39:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5EE9F80234; Wed,  4 Nov 2020 17:39:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C5FF8015A
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 17:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C5FF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="FNJaV1J2"
Date: Wed, 04 Nov 2020 16:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1604507990;
 bh=zFr1vogUyEO6T3/hic1yln7vOBJ/TAM5DBsPrLLYhTk=;
 h=Date:To:From:Reply-To:Subject:From;
 b=FNJaV1J2CRgA4aF8CriIwh6nolMOH26aAiNrXCRQGpWksSTLfC35W/1AazGjipvNi
 tNtEqhuHQOWgABBtm9imtaiioVw4lBHQpESBwMbhfl9Z+bot+Q7PodjO+p+GvbGYMU
 r1EQOAf6teB34k5texG+qzpx89qWtb5eHoJKxVdM=
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
From: andythe_great <andythe_great@protonmail.com>
Subject: Alternative to HDA Analyzer that can change Audio Mixer Source Node?
Message-ID: <NMMrX5r9YriUTUL56e4hAGhhKsQf7Q8mIkO5jeQzbAHdGwbYBwxnL6a1OybejYEtL0MVUqEeWHYzMbFRdjpc31j2KY4fPtHtMRThZfbygVA=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: andythe_great <andythe_great@protonmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

I need a tool that can change Audio Mixer Source node as seen in this scree=
nshot circle in red.

