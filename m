Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42123581B6
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 13:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 872EA1666;
	Thu,  8 Apr 2021 13:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 872EA1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617881222;
	bh=eGjzl9/cD3BILS6L0jj8pWGBSXEAv/ZgBLv8odMuQS4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQghH52NmiBvELmtN5b16Cp9BVJ2eTcK2kdp3DXgaqtJSUyZ4FMHrUsxYU5ola8pE
	 80z2LjjGv1WO5C5BlYZc2LEbwBIFdLWJeHPpbo7wWnUlJsf6Sg2duSaMeggNhJNmyk
	 116szByscMN8yMuQGhGRXBx7498ng0VC8nz8bmjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF024F8012F;
	Thu,  8 Apr 2021 13:25:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C56BFF8020B; Thu,  8 Apr 2021 13:25:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34EBFF80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 13:25:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B8190A003F;
 Thu,  8 Apr 2021 13:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B8190A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617881126; bh=6MTTIh+KX6TUFFdvYZMSS3H7C7faPZ7iwfGprzyi7Qk=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=H6d2yd+rbjrkwq2FnjFMu2MOMx5xDKNSc70TrZtEP60TBIhqoqbGg4LplWyBkLvV8
 xjYf1jIcHV8M/FcLtBA0Okq4QTKw8OzgFc7Zvew/8xVpb8Qq7WBJ2RovV9DDXcV2dx
 KMbZpiTg/dA9OvyvomZh9QxREgBC9tUHSzbDjQaw=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 13:25:21 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <db5bc960-3f8c-8e95-5b62-67ea99947a4a@perex.cz>
Date: Thu, 8 Apr 2021 13:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210408103819.GA40407@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 08. 04. 21 v 12:38 Takashi Sakamoto napsal(a):

>>  static DEVICE_ATTR(number, 0444, card_number_show_attr, NULL);
> 
> Use DEVICE_ATTR_RO() instead.

My proposal is consistent with the existing code. The cleanups should go on top.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
