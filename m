Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B334702DB
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 15:30:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E39C204B;
	Fri, 10 Dec 2021 15:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E39C204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639146599;
	bh=vYr7ai1Y/QYM9SXpnQW9J1SPyOHuP3ilj3tnJu0vmeg=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o8miO2bjRQECeFTDp7gn2J01ZM4H6xbV43CE9hua8jlt+uuhVCY0cOimxkL3pXr/N
	 sq61pE66PYdc/NLfuuuU8QuktSE7k5PaIn19mHnl0vtHSh4wJD9Sk2GsTHY+1dZt96
	 2aF5zVNrgtycPAEbBPs2uYyV+8LnYYLohhu3uPZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A1EF8028D;
	Fri, 10 Dec 2021 15:28:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACAB9F804EC; Fri, 10 Dec 2021 15:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2898F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 15:28:38 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 06A01A0040
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 15:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 06A01A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1639146513; bh=m266FMGrZ81suO4vO9/gt4abUd1+GkLYybGgb2a8cKE=;
 h=Date:To:From:Subject:From;
 b=cXTtKKAKExpetynRu1B3o30BtEKi9UM1eslqY9QTPHs407sCtRu16WYi5RBzeut+y
 f/85+qVsIOH0R9PxfUr9y044T8o8EGkImntDp7yeeTngorpKLFKnzBudUDN14yzQS2
 CrS2SGsitDRdBswqYL36TFOCXuZ08iCtFOlrNM6E=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 15:28:31 +0100 (CET)
Message-ID: <d39d643c-2276-580d-ba8c-c59921ffa680@perex.cz>
Date: Fri, 10 Dec 2021 15:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: ALSA development <alsa-devel@alsa-project.org>
From: Jaroslav Kysela <perex@perex.cz>
Subject: ALSA 1.2.6.2 release
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

        new ALSA userspace packages were released. This is second bugfix
release. You may download them from the ALSA website
http://www.alsa-project.org or directly:

        HTTP: https://www.alsa-project.org/files/pub
        FTP:  ftp://ftp.alsa-project.org/pub

Released packages:

        alsa-ucm-conf

Full list of changes:

        https://www.alsa-project.org/wiki/Changes_v1.2.6.1_v1.2.6.2

The fingerprint of the public signing key is:

        F04D F507 37AC 1A88 4C4B 3D71 8380 596D A6E5 9C91

				Have fun,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
