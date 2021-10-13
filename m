Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39942BF46
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 13:55:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEDC0827;
	Wed, 13 Oct 2021 13:54:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEDC0827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634126112;
	bh=+XpSSz7kfx9cOskxY+plUzpobe3gcXW9kKCHWBnerVM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p3RhANAUVC91A9NnoXC+O9cE3E/dMjHE5jp1RnHgN9arUMQwhetmEnXtJoecNZVir
	 P1kU9Jf9DMvyHX2vL8gFinxc3F45V1vPyrp9eTr7s4IREh69K9Aqf7FQq2eKiuMJFg
	 /zZBF8sMRkFjvWhKPUXJk2iw5JHo0VP6bkV9gnAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DCF7F8028D;
	Wed, 13 Oct 2021 13:53:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5DEF80269; Wed, 13 Oct 2021 13:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D41CDF80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 13:53:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6BD27A0040;
 Wed, 13 Oct 2021 13:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6BD27A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1634126026; bh=3CILYcV1hXTNSlAKDNYVDtKFjT1QSQT7SeDZBjw/4lM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=wMuinWb3bniXFtGyQNXoliJ/7Mgd438PRhdS66onSdKYtDPTXXYjxCiTzzIeNNgn9
 fi3shVqUoVGP15x9AafXOinvYbxoDY/+cB2Aa3tZREw2+NPLUoj+m0LkCIiNAzw9za
 c2zkQSsHxgZBfMrNxvYi/f+WbGxWy9aQbMmgdmPA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 13 Oct 2021 13:53:44 +0200 (CEST)
Message-ID: <9be0ffa0-ac67-5c22-b1b2-3853097317ca@perex.cz>
Date: Wed, 13 Oct 2021 13:53:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] alsaloop: added option prateshift for PLAYSHIFT ctl
 elem used in PLAYSHIFT
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
References: <20211013103343.40522-1-pavel.hofman@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20211013103343.40522-1-pavel.hofman@ivitera.com>
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

On 13. 10. 21 12:33, Pavel Hofman wrote:
> If snd-aloop device is on playback side, the required sync mode is
> PLAYSHIFT. That means Loopback ctl elem "PCM Rate Shift 100000" of the
> corresponding capture side of the Loopback pipe must be controlled (by
> a reciprocal).

Applied. Thank you.

					Jaroslav

--
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
