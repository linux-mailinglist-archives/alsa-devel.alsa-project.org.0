Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF274697D8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 15:06:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A562047;
	Mon,  6 Dec 2021 15:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A562047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638799565;
	bh=B2//pyhOGeeX+AchdMUdPjEyKETmOMRsUsdsKq+VSO0=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k6bQx5RHrps4VI0vqXt2cFjbuvDYMMyFB8nvEEAs0CvrmBfo1c3Ef3nADNUjBnT7G
	 Kuq2fTDseU1mZhYPzNQVbhUeMvl6EQNwSRHAIuskTgbkLsgJC2IebYskyBZ7lKicKS
	 ESkpHrn7c/1mXxsKFHCTXNCiOwi+6YF8ipYsqOAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB19F804ED;
	Mon,  6 Dec 2021 15:04:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF9DF804EC; Mon,  6 Dec 2021 15:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332E6F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 15:04:36 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 977CCA003F
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 15:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 977CCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1638799475; bh=Pt2QopUzEHjuVBtEUwwEQrzM5DNkl0AGLvUvjJsRF8M=;
 h=Date:To:From:Subject:From;
 b=3RgbVGWv/eactExsebIZdLQH8Nlh1ldkCgzzrxfk8//ExK37j0pXAJHcK4dgFcY3J
 bEyNH3C0joaOhrdv2LgvhkmFctwdi/I/JVzHGhuQo1riUzRItnkdwvKQ6P1ZCJkMd4
 NMAijJ2Fu2+NbcNgD3lbxSbJ+lasgCKbBcesNqng=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 15:04:34 +0100 (CET)
Message-ID: <0c540952-d18b-ba38-47d9-4a809ef401d9@perex.cz>
Date: Mon, 6 Dec 2021 15:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Subject: ALSA 1.2.6 release
Content-Type: text/plain; charset=UTF-8; format=flowed
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

      new ALSA userspace packages were released. You may download them from
the ALSA website http://www.alsa-project.org or directly:

      HTTP: https://www.alsa-project.org/files/pub
      FTP:  ftp://ftp.alsa-project.org/pub

Released packages:

      alsa-lib
      alsa-utils
      alsa-plugins
      alsa-ucm-conf
      pyalsa

Full list of changes:

      https://www.alsa-project.org/wiki/Changes_v1.2.5.1_v1.2.6

The fingerprint of the public signing key is:

      F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav
-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
