Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E93ACD88
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 14:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC38165D;
	Sun,  8 Sep 2019 14:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC38165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567947146;
	bh=z6yH2nqMMUgQc2r8QDvEH+tW3sw3nkyq0lLgePBmyxk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GK7qUchK35Gud1O5K/32oM4IkKJg0vimRmu/IDtygowZSSo6S9hrQqUEyeeIKcqvT
	 OyNMbqMYO47aLQ5M9vantIvvGPQnQ0Gc80VoQ5dSeAbl0vCnM210FNsWGrh2xNQogj
	 IofQN8pa6q1v9MNgN9gAATLZQTLweMUa26RCUtX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DF2F80368;
	Sun,  8 Sep 2019 14:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8551EF80368; Sun,  8 Sep 2019 14:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44FABF800E6
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 14:50:35 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 259C8A0040;
 Sun,  8 Sep 2019 14:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 259C8A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1567947035; bh=081aClH3yudIvTmcTN0Iy26MyJW4BpjeCqbsHsg31/E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FzGaAsfQ29e6ceQAYoFaB/6efVJk60+9BpTwS1KyF0l+mOkZtOO9ZYyTAGti/491c
 UYhliDrCuUaKY+qkczD9maJVgCGogC8dXJTWWAqZMVeHLrMfg/vLTUpnjFI1pzQswy
 B4qzfB5PKaA3eyOggcphvFpTUtdwzbM6bevvXjGA=
Received: from t510-mob.perex-int.cz (unknown [88.214.186.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  8 Sep 2019 14:50:32 +0200 (CEST)
To: "Lu, Han" <han.lu@intel.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cf4b5150-a9f5-fa82-8e4b-0978509a60b6@perex.cz>
Date: Sun, 8 Sep 2019 14:50:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel]  Licence change for your alsa-lib UCM commit (Lu,
 Han: 1 total)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Resend (delivery issues for the direct e-mail). Please, answer. Thank you.

					Jaroslav

Dne 08. 09. 19 v 12:39 Jaroslav Kysela napsal(a):
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).
> 
> Thank you for your time and co-operation.
> 
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>   3c263716fd5bd2d9d5308cb13dba667d138c0097
>     conf/ucm: broadwell-rt286: add ucm config
> 
> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
