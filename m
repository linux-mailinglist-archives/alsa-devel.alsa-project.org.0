Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4DFACD31
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Sep 2019 14:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A55F165E;
	Sun,  8 Sep 2019 14:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A55F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567946860;
	bh=Kz0uyruipr0XN3UeLLR/uvJV9FTrF5Q2Mw9pvF2jqus=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXJsgtCvvMny/mJArMaj00DvaciEK85G/STETWi7YmJVAEH7DWpWXwE8WKHSL/T13
	 0zeaUSJdEDzHXA7d0pvNcXEiXvDAhODOrVS7ANMVQim6/MhkpxEvR4kE23q0quSnCy
	 Q7sOhBiCucW0XrlRgnXwnARAOrzWhI+MG9CanVNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC94F80368;
	Sun,  8 Sep 2019 14:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D54AF80368; Sun,  8 Sep 2019 14:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C76F800E6
 for <alsa-devel@alsa-project.org>; Sun,  8 Sep 2019 14:45:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 566C1A003F;
 Sun,  8 Sep 2019 14:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 566C1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1567946747; bh=DH8s6BLdCx2AkyMmHLo+9/q8200+Rg8saa0x7NkbO7E=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xDNbNe4QmTnnAN2TrQXOiXWMVpzmXjxiznP+pOYsPvhVLaQUH1Qv28j/TQKSg2QMT
 ExamnMQKaSJjHYEWQA3XB0QC2uWU9lRLKp6JGdGhQ4MZNBfTsczBv0KoLP/SbrhMO9
 qX9BwF4I7o/txqilNyN3d33e+6MWG1Yh3hiq3100=
Received: from t510-mob.perex-int.cz (unknown [88.214.186.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  8 Sep 2019 14:45:45 +0200 (CEST)
To: Han <han.lu@intel.co>
References: <15679391594432724-alsa-devel@perex.cz>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <50d38c53-78c8-0593-2029-f5502c49b69f@perex.cz>
Date: Sun, 8 Sep 2019 14:45:43 +0200
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

08.09.19 in 12:39 Jaroslav Kysela wrote:
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

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
