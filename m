Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77420CA4E
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 22:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980A11677;
	Sun, 28 Jun 2020 22:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980A11677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593374833;
	bh=Mx3G2jVs/chAN0bKmwXnCi9GVJxxxxsXoij7mXxaOXY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ih/y/babz3nfwGEPAAyR/GyoigdcLD4715zdUKyi/ma632/3hD/LFeFVeCQM0r5B7
	 7AgvjNu/7QxZPkf+vqB/b+xIibTspaLwUlXabVt8Zlu5ZiOXyC/HcV9o18MdS1URLw
	 z3kq++P7ZKSMSUkV1chv6mVPQej9JWrMayhg9ujE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAD2DF80245;
	Sun, 28 Jun 2020 22:05:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4C6F8022D; Sun, 28 Jun 2020 22:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32650F80096
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 22:05:24 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C2E04A003F;
 Sun, 28 Jun 2020 22:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C2E04A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593374723; bh=CvyR1v9XOR2Fsj82ucIVxHpBHDA/B9Eg69x4aKFi/yA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GhJR8PAicydZlLx/JbiDONfHBXZuuw7iVzWLTjcevLPfqNq+x4NrqpUaewQ1lsBW+
 cVfgWGVZtDgi65PnveDUPOyrf9Jm2vLXdeyKQ87h96QL43jKDizIF5Xk3wt4/eT37B
 MaZELfHlJmzaRhphYmdav+1H8tCA8oYHdpYoqO9s=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 28 Jun 2020 22:05:21 +0200 (CEST)
Subject: Re: [PATCH alsa-lib 1/5] Fix invalid "Regex" Type in various
 Condition blocks
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20200628174421.115133-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <55bdcbca-8f0b-0f62-d98c-b492f1843e34@perex.cz>
Date: Sun, 28 Jun 2020 22:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628174421.115133-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Dne 28. 06. 20 v 19:44 Hans de Goede napsal(a):
> Regex is not a valid Condition type, using it leads to errors like these:
> 
> ALSA lib ucm_cond.c:300:(if_eval) unknown If.Condition.Type
> ALSA lib main.c:983:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -22
> alsaucm: error failed to open sound card cht-bsw-rt5672: Invalid argument
> 
> Replacing it with "RegexMatch" fixes this.

Thanks. All five patches were applied to the alsa-ucm repo and the 
ucm-validator was fixed, too.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
