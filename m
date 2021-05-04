Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C131D372DF9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 18:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 719AB169B;
	Tue,  4 May 2021 18:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 719AB169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620145425;
	bh=a84OlkVtvvfyp3vb7dQ6iFVft9BiyVaAq+pzoH+Bhcg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ju3g3cpb9tIQ89gIdG7W5bn3Xjd+ATk+Tw4zXiYNMix74ThN/UQRziULHBeATuerV
	 47LhcrywrUNB2NsSJwcaRD0S9MwQgFApBIDZfwRVy4FXM7MhIlvwLOaIda2Mym7/zv
	 ntYiJXzEvMcSIVS+rUtnxEhO9iD0E3g6eWMj18/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF43F801F7;
	Tue,  4 May 2021 18:22:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 254C6F8021C; Tue,  4 May 2021 18:22:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFCF5F80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 18:22:08 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 32BE1A0046;
 Tue,  4 May 2021 18:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 32BE1A0046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1620145323; bh=cL94rCKoOSC+RHC5Z8Dr88x4Qp+cUy///LiEStiP3Ow=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=FaYpSnA8RjvjNmUOk5WhfkEZxekYOM59AR1QqlXNi5O743UCSTmp/fT+y8jCmUQzB
 q+yQt+Pow1LdJOhHucb58BjOlzRHFJuS85mayD88cB9ZxLU0sK4S+uRJ2GulPJqWeK
 eeYJ+C1utlakVZD72yWD+EsW+JmzSLGBXwkhYz9k=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  4 May 2021 18:22:01 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] mixer: simple - Fix "Capture Volume" and
 "Capture Switch" being seen as global controls
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20210504155830.112653-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <776d9394-5c83-8af7-f7a1-6aa73390b34d@perex.cz>
Date: Tue, 4 May 2021 18:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504155830.112653-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
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

Dne 04. 05. 21 v 17:58 Hans de Goede napsal(a):
> Fix the "Capture Volume" and "Capture Switch" exceptions no longer
> working after commit 86b9c67774bc ("mixer: simple - Unify simple_none:
> base_len() exception handling") because they were moved to after the
> suffix checking, so they would be treated as CTL_GLOBAL_VOLUME resp.
> CTL_GLOBAL_SWITCH based on their suffix before the exception check
> has a chance to check for a match.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
