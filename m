Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2E70B557
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 08:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171CF822;
	Mon, 22 May 2023 08:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171CF822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684738162;
	bh=IEcEsEFCmMsPi9umhZSCGob+gjXwo5nRCAz/W7c6/8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bxkfSHo4P0FYXBG4QYiPEZjOgCxdgOcJUgMsMagPG28zZRu1iWlPqI5/igS87P/Ra
	 D3oY0MPOlmKkfK8AM614CLj5eD9bNlIu1lg1MJbePAloDZkh6sWf0PCFAnHIKIurdK
	 2snbnlK3uR82b9c2gv0ICRICJCGefD8sC+P+FY/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE35EF8016A; Mon, 22 May 2023 08:48:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 845BCF80249;
	Mon, 22 May 2023 08:48:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B040F8024E; Mon, 22 May 2023 08:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CE84F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 08:48:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id C7E751E2D;
	Mon, 22 May 2023 08:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz C7E751E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684738105; bh=7E6FJuILzR8swlFVfY3h9kbKa7FU2VuRLPSnnPXomIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MqQdoBetAV53HKSasukoShofuzESjNCCNGA09uIDQGLB38zMKNlhb2l0rOvrGon+t
	 dbTW3XFPkQjeRLqJvWle3Kv+yXGcl5ZEWGlFcDnk7YfWoOVXRzJ4IRH+zUo8rL/iPG
	 OM1Fk29z13z7BlFeGu/lWXB+U15jPkKffWtyCI0Y=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 08:48:23 +0200 (CEST)
Message-ID: <ffa61c1a-c293-ed73-d0a8-23fb339813f7@perex.cz>
Date: Mon, 22 May 2023 08:48:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/36] ALSA: usb-audio: Get UMP EP name string from USB
 interface
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-10-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230519093114.28813-10-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UFR2N6PEWGUQ2QU5E3BLR2L3JKFC6N7O
X-Message-ID-Hash: UFR2N6PEWGUQ2QU5E3BLR2L3JKFC6N7O
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFR2N6PEWGUQ2QU5E3BLR2L3JKFC6N7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 05. 23 11:30, Takashi Iwai wrote:
> USB descriptor may provide a nicer name for USB interface, and we may
> take it as the UMP Endpoint name.  The UMP EP name is copied as the
> rawmidi name, too.
> 
> Also, fill the UMP block product_id field from the iSerialNumber
> string of the USB device descriptor as a recommended unique id, too.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

