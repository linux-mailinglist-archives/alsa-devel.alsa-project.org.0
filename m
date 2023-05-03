Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC1A6F5BB5
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 18:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD43212F1;
	Wed,  3 May 2023 18:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD43212F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683129864;
	bh=8t4HL475nWT/RljPE8Mk56yYt2O+/Gw8AsM373qAXRo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UKAsAvKIzX15HGIbl0DTB6fEDIULSC6NeRoMJT0HGHPTfv3sFyOF/qCl0jP44dlxn
	 tZRbEQ5E70Cs2MWvdJgp1C4X/uL/0e84Y/sT0LKgHu0uP1ZUXuLJ1PCv6bZf4mFGMh
	 r54EYw5Mitxo6lbrDIgq0wn4fJaW/AlWd2EFPu3I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0BFF8051B;
	Wed,  3 May 2023 18:02:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E544FF80520; Wed,  3 May 2023 18:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD850F80087
	for <alsa-devel@alsa-project.org>; Wed,  3 May 2023 18:02:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B1D7A11E9;
	Wed,  3 May 2023 18:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B1D7A11E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1683129772; bh=7Mck9T3dpzvxMwM9VI0zZVSWjN9xl/qTD7ddWK+dcRI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bl4KvhZX2u9KbRP/o9SQMEuEPyzZ6EFDQBf6riUPFgeAU+fKlBwAdrR9QgAzcMO9g
	 jT8P5DZWbodCc+rUj3jPAoZGK7UXVcPVe4d7bOXndIpfCS+xFZH4ykpw+rRCon3DAf
	 MqK3z2RzLKmwy/OYqNemb7GodWtiQAUF5yI/pD5w=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 May 2023 18:02:49 +0200 (CEST)
Message-ID: <91e9739b-0767-ce2f-16c0-654b6d5e1ab2@perex.cz>
Date: Wed, 3 May 2023 18:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] pcm: remove duplicate SND_PCM_HW_PARAM_{FIRST,LAST}_*
 #defines
Content-Language: en-US
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 alsa-devel@alsa-project.org
References: <20230503155534.2121562-1-oswald.buddenhagen@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230503155534.2121562-1-oswald.buddenhagen@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VA4S3D4EH7COFIH7PODN32NUZMFCDETI
X-Message-ID-Hash: VA4S3D4EH7COFIH7PODN32NUZMFCDETI
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VA4S3D4EH7COFIH7PODN32NUZMFCDETI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 05. 23 17:55, Oswald Buddenhagen wrote:
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

Applied. Thanks.

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

