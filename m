Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F213A66D0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 14:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71C0179D;
	Mon, 14 Jun 2021 14:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71C0179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623674557;
	bh=rckDRZxhAROSI7Dtz6i2HKJFADqqRaYcjfRW+FDoOhQ=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XdpXfOFAE7DFr4TbQiChlPn4o0KK/igCDz115qt7GIHTwziCbOb6YvPp/3dOgNRJi
	 OM0pGF5vrAuRSVCEmojaDOz5Yy5/5rrbVSMLI8R9xOGyvZikm19Zh2fV2u81l0a1zL
	 9yUrJkf86uxLobzbvahu6mJN+xp8qI3z4i5X+P+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2224BF804B0;
	Mon, 14 Jun 2021 14:41:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE7CF80424; Mon, 14 Jun 2021 14:41:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B48F2F8025E
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 14:41:02 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65714A0040
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 14:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65714A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1623674461; bh=y8fma+gfx1FcPCdgj5f2o+GBMjrXpK4pAtxJckcIA64=;
 h=To:From:Subject:Date:From;
 b=Qul+eIW7nQcRwTiilfddiiHJoaJN1oe+nQ59qgqF1JS9nK/XbgoJ2Sf7kScS5BxEp
 bI223mRKPK9K26KOV7MBLsz6JU7G5T//tNc4t58ApTvieSLhvirYrdLFWhU0ARuTN1
 3LDM6/XyR7dnPj39PNsx+c1DnpaUjw+Natx2p7jI=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 14:41:00 +0200 (CEST)
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Subject: ALSA 1.2.5.1 bugfix release
Message-ID: <e5098099-e79f-dec1-c27f-44b6e6b0c16c@perex.cz>
Date: Mon, 14 Jun 2021 14:41:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello all,

     the ALSA userspace alsa-lib, alsa-utils and alsa-ucm-conf packages were
released. You may download them from the ALSA website
http://www.alsa-project.org or directly:

     HTTP: https://www.alsa-project.org/files/pub
     FTP:  ftp://ftp.alsa-project.org/pub

Full list of changes:

     https://www.alsa-project.org/wiki/Changes_v1.2.5_v1.2.5.1

The fingerprint of the public signing key is:

     F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
