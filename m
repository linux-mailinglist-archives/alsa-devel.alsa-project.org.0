Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6A23E862
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 09:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F181607;
	Fri,  7 Aug 2020 09:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F181607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596786876;
	bh=fIq8xGkAbtEk8qxPLPMJ+RCT2/odmyCAKH2RvwvvnZU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z4ayQ3/4ENFf2pzPbdbejzkTCi5sjZbWimuW9ENrm1MwxHtVw59+tlChbUwn8FcCF
	 a0JCie8tmRl9ZtvUX+jz4DzeLWQ1cmMskePO1DgA0k5XdH4fwb7dx1BjGCAOB60G7O
	 Kz3kxC9nHFQviURwgcJQy7wqWi9O1SLVPCzYWd24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ED2BF80234;
	Fri,  7 Aug 2020 09:52:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4878F80218; Fri,  7 Aug 2020 09:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B4EBF800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 09:52:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F20DEA003F;
 Fri,  7 Aug 2020 09:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F20DEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1596786760; bh=JbQ2RqKxQEqeM47/reVnLO4WH6ReD7G8thwU/kpOhI4=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=2vfA5AwqXkuQ30Zaqeiz7uXJhHogvTcX3npUSEuLhLxG+ZzYyd49zBSc7vZmxzU0l
 lV8EZCFc04Kf4cKa75rUWHtC55NOVg4yzmq0/KBLH1iAatntrxuAX6MIsMUfXz+lkC
 s8wx9MG8KlVCmuF7Yqgbfs5bDA+X+CLbzSk+cg2U=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  7 Aug 2020 09:52:36 +0200 (CEST)
Subject: Re: request for missing access permission to libhinawa repository
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20200807051853.GA453546@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e45a2bc4-af63-3996-35f6-6558261c9106@perex.cz>
Date: Fri, 7 Aug 2020 09:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807051853.GA453546@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 07. 08. 20 v 7:18 Takashi Sakamoto napsal(a):
> Hi Iwai-san,
> 
> As Jaroslav is absent so long[1] (summer vacation?), I would like you to
> arrange some team/repository settings for libhinawa.
> 
> I lost my write permission to libhinawa repository[2] since Jaroslav's
> arrangement for github team. You are an owner of 'alsa-project' team in
> github.com, and I guess you have enough permission to configure below items:
> 
> 1. setting enough permission for my account to libhinawa repository
> 2. add libhinawa repository to 'GObject Introspection' team[2]

Oops. The permissions are fixed now. Sorry for the long delay.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
