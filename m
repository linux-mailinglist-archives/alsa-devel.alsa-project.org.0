Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61F1AF846
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 09:43:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E65E0167F;
	Sun, 19 Apr 2020 09:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E65E0167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587282209;
	bh=0CUGCz8/5TiP6Ufqia5Cgb8EYAj0sqfBm845dVqP5k4=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a9FJYR7KIBvykwca5YlyXQj8Be7MZr2dGF33h/x1EmHMbOxIVr35Vfo4mGld5Mfz2
	 aXQqcmWsGHXAW7ZwJwMQQVqOOu3dFUCHonX7VQk7cYlXjrCQu6EChyiyiqJXltFMja
	 Ek53DvbMVy1dMyUtGPbe3kQNcc/AsWEGKI97UEJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0FC2F802A8;
	Sun, 19 Apr 2020 09:38:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5045BF8014E; Sat, 18 Apr 2020 23:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F191BF800E7
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 23:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F191BF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="Ce6A4T+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1587244962;
 bh=0CUGCz8/5TiP6Ufqia5Cgb8EYAj0sqfBm845dVqP5k4=;
 h=X-UI-Sender-Class:From:Subject:To:Cc:Date;
 b=Ce6A4T+TeVEqvnV9t7F+3kroNK3RqNki4uLRYIMbSxLpqzSfQ67oTReAhu2aJeVhp
 QKVJAPPW0x9lAQyHc4kCCBPW9bWDLdhoga9vrg1pnAIXPoKonbYoUJh9onDrwBGrha
 dbKuFCnU39PRH1A9dC2jv2LcIScPti87caDgVp1w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.36] ([85.127.240.3]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJVDW-1jfEss1g2i-00Jqhw; Sat, 18
 Apr 2020 23:22:42 +0200
From: Johnathan Smithinovic <johnathan.smithinovic@gmx.at>
Subject: PROBLEM: No sound on ASUS ROG Zenith Extreme in 5.6.5
To: tiwai@suse.com
Message-ID: <f19e2e93-8d6d-207b-202a-5ceeab0f8571@gmx.at>
Date: Sat, 18 Apr 2020 23:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y9QSTNdqf1Z5zsK4TmLWsR7G5M09rZqNEveIOoMOJb/zHcvbqTu
 6HFHuGDsv4H7lY+9Eoi83DffsvMCYemQgCAb6r7q7+UL5RSwxOAsx/rSHlPtmNZhORkZLNW
 bpz7aRaBUMWSeLf3QYsJi2axcsIPq+VfYZm7NHG2FNQ9j/cQb5FhcH14QtdfPj5yI2++QOe
 9qagHKpD104SM7qrhocEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5oMSYX0pp78=:3fjguAHctVSsMtOYcSKnLK
 EH6C87gFZH+SIpo8rDW8JIVzRnIWNRtT0JiH0gXIOTjliF8Sx3deR2BhkOuq2S923Vok1Zvdk
 xAcS8A0P/bQWp6NaneBB2DEVVSjjzg7mX5+2oNUkx95neTBCRJOW6ykq9yY11VkQ67bUqjPNf
 xdAkTEkRgU7HHJoTR0EKwOS6J9ZYqSKYtnT2c/ZXpfYXFTuAOrrZawpNdHxxCjaKFZbJD0Ty7
 gHLxwoQyimJrgLtRjTWTAc5ykkz3Wf2KQnj1a6Bl9U9rHIWJ0RHqJh5bzkoqf8goxirNK/FfY
 O2VBA09kBLJggbhnvjTuAavNqqegtBxHEJGCSkGpy+Ui2MxiabdfT90HR6DjS3ynF01FN5+x7
 rFKmKiTgB8Ib3t9ec9kU+4RSRkPLEAPNLQN2UNNiVCaTyPG1rLE0ngcs43w6yRW+B7zw1VLgs
 LbVLHW+BysSPuK/08Yj72W53kE9QhvDR4dKDocI+IxJ/pD+T3RHQkq7X4rtiKiP263KIBGLcq
 3iwbJj8NgBT3Gz3NlDrrfmkMInPFKATd/iyvZR5PHUC1mxd6SjeS+70y9dcJ6+NtCTI7ODDWk
 pY6Lwe/NLjVk7kGd6Cmzf1ugd68jaX00Lpe8x7T5QLWDWT8BS5G5bngrnsFoxoPUFk4FRV47k
 zIRmx1lKK2wOYkvNZDdeYSAoBsrOis2ca39aD1+wC1uDQ9fBGnkgZ/0K6DrKbMkE06v60lLQx
 ETKrSYac8tcagNDRy4uOxXtUTRL1yALvshT9fy5e/re/+uNswfJBcucvX6bJz+1DNIBGz4OvW
 xk9zUmTxPUIwWgIDu15RgGk0JnAHFosMkSpQH6L2acPLTbFL8YAhlLAk/6/HSIdu3dtsoWOKh
 bnJ8b2k9VMHkStUj5KMc6ey3YnlGoGrk48KLOTKDvQK72W+U+VrY/Q/MFZIGGn0VXEf3UNuS4
 s9nlApG4raRakmqZYonilIevghqUjL5QnGjOwO2aCrTcNE6Q8v8q7Hz+tuLYh3LjRVQKBYyoV
 JBZ8A3Y6kyo5o//fVp3u8bEVKnjN3esX9pAWc6qURtYYJzi8RuO8bMj798P1gXWGK7Or8Ueh3
 61jZ25R2qXdwe8snqkinJZ/hz39h6hdE6VrDQXMmmCTsFu7XocDBGk2w+LF+VIP61d9pr4gbC
 w6LYDWXNUGAcYTnuBgmHCijywMMnjTdzsBq9gGjUxrUZhEtjqMbrNmECAydAXvAl/YK2B6i/m
 tG+l16vnTYe1cdNSVfrggukPiGUCtfsu6A35RfQ==
X-Mailman-Approved-At: Sun, 19 Apr 2020 09:38:23 +0200
Cc: alsa-devel@alsa-project.org
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

PROBLEM: No sound on ASUS ROG Zenith Extreme since 5.6.5

When I upgraded from 5.6.4 to 5.6.5 I noticed that my sound stopped workin=
g.

My motherboard is a first generation "ASUS ROG Zenith Extreme".
(I'm running Ubuntu 18.04 in case that matters.)

I'm pretty sure it comes from stable kernel release commit
7f722d9aa00fde795834840cc84e13a94efb29ed
(git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git) which
notes "commit 3c6fd1f07ed03a04debbb9a9d782205f1ef5e2ab upstream."
("ALSA: hda: Add driver blacklist").

When I comment out 'SND_PCI_QUIRK(0x1043, 0x874f, "ASUS ROG Zenith II /
Strix", 0),' in sound/pci/hda/hda_intel.c my sound works again.

(In case I chose incorrect places to write this mail to I'm sorry. I
tried to follow
https://www.kernel.org/doc/html/latest/admin-guide/reporting-bugs.html
while keeping this report minimal.)


Kind regards
John
