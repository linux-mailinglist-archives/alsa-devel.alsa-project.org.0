Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847F31573E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 20:57:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1538516BE;
	Tue,  9 Feb 2021 20:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1538516BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612900672;
	bh=4zUHBIBdjvoTk7aKBoAAc7UNU24ZornZscYb4ne/EYI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jMvx4HrrqfHESCcBD0TBlW5aiNGFFrg5ncIConDWYddjCyCG/lxhbOLAaL6bPry8a
	 vOCwO7ghQkGx5D23T92DDX+Lejr7IuAeZ7Bcg9YcdwnVFtI3zi6//5S6cN5b1IHvLH
	 mxeUHB3aQo76FHTktS/Rp1OqoLrYlVOUG0FjHSig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C650F80107;
	Tue,  9 Feb 2021 20:56:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A445F801D5; Tue,  9 Feb 2021 20:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A59F8013A
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 20:56:07 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 97E44A0040;
 Tue,  9 Feb 2021 20:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 97E44A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1612900565; bh=jFwSsbeUqLEavagcEbXjVYNaB1Z7G9gHsfy+OBRhVBc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=q1+7UvOWuYMo+b8fy4yOvd7rnn7gwUhvHFz9qjd4BA+3+0GlstObFvM4L4TnM1MJN
 e5zCxn6DUyZrCjGygkcL64TK0KpfJ6Khn/q+Uv6WvcqEX7GXRspW0Tw2GrN+H8T9SO
 O9YlV2W8Tx1efvVa6Uo+fHCd96v0zPDK/IKdXk7Q=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  9 Feb 2021 20:56:02 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf] bytcr-wm5102: Add new UCM profile for BYT
 boards with a WM5102 codec
To: Hans de Goede <hdegoede@redhat.com>
References: <20210209190859.70997-1-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3d2dca5f-dfa6-7a5f-7996-2fe8b53fa83d@perex.cz>
Date: Tue, 9 Feb 2021 20:56:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210209190859.70997-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
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

Dne 09. 02. 21 v 20:08 Hans de Goede napsal(a):
> Add new UCM profile for BYT boards with a WM5102 codec. This has been
> tested with both the SST and the SOF driver on a
> Lenovo Yoga Tablet 2 1051L.

Hans,

	could you also add the configuration for the hardware volume mixer controls?

			Thank you,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
