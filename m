Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151135C2FE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 12:05:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24B191614;
	Mon, 12 Apr 2021 12:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24B191614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618221924;
	bh=kxDF1Hd23hw0YnsEHBl/c2KPlOik8sKp66pMX7bdneA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kSE9IiP6mOgTdlLbQVKPqrtF1pTUOSze2tzAtfc9loyoEu+jP43gJKqVp353/qaoD
	 Ai/T7hbMKHbqgnV0NOEcgg4+qpC+LwaZ900llBcQ2L1J/BccAzyj4BxnsyRRseEJqN
	 rCNfC7YFyzAhITwVit+EIgdNWZyyKRAg6i5o0AyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1D8CF80271;
	Mon, 12 Apr 2021 12:03:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67A61F80269; Mon, 12 Apr 2021 12:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF146F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 12:03:36 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C5822A003F;
 Mon, 12 Apr 2021 12:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C5822A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618221814; bh=aGn0phnGZ8gsn7rHRNC9qC4Xyu12zPmv6OCTOj3ryC0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xccLWKQAjjwmNLaUABlyoFlx8ItD5Ct4JjpMjiDaHyDRH1zpiHeI7kxtWkc+sU2Bh
 i5WYxTcxQOLz9WadNBY4Je1xsOUKoaIxct8GRXvS5QJncfI3d5/4tjbT8sYEnuOPJ1
 aLMBwDJT9H0g0wCiYe3VORQJzwSfcn/DaooGesE8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Apr 2021 12:03:30 +0200 (CEST)
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>, David Henningsson <coding@diwic.se>
References: <20210410120229.1172054-1-coding@diwic.se>
 <s5him4r3k1d.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d1ac2bc0-01f2-89c9-395b-407a1831541a@perex.cz>
Date: Mon, 12 Apr 2021 12:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5him4r3k1d.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 12. 04. 21 v 11:54 Takashi Iwai napsal(a):

> And, the patch misses the change in rawmidi_compat.c.  It's also the
> reason we'd like to avoid the bit fields usage, too.  (Not only that,
> though.)

Looking to snd_rawmidi_ioctl_params_compat(), I don't see a difference for a
version with and without bit fields. In both cases, the value should be copied
from one structure to another.

I see other structs in include/uapi which are using bit fields in public ioctl
calls.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
