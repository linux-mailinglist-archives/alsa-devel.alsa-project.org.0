Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB317244F0
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 15:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5424883B;
	Tue,  6 Jun 2023 15:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5424883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686059578;
	bh=AXhUydbYyEMKr38lmLrX/4C6TkA2YSsKpLSO2kmGAgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ie1Z5aWnlr1gLDHrQG4vfCcNgOsSIhEQHKhyK4LGyMTvBiQqc+zgg4JNYnSLZbD9b
	 0yN0gn43aGks1obeHFLSYjRh6ys3CxtzxlblcHriOlIecdW/RjWpu/cb5Ao2GibxXl
	 +oS0RXZ0/1Ei4+LbZFJHRXBJ3g8fmKcLGYiM6kFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B63F800ED; Tue,  6 Jun 2023 15:51:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E36C5F80199;
	Tue,  6 Jun 2023 15:51:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0C08F80254; Tue,  6 Jun 2023 15:51:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F076F8016C
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 15:51:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90FB51E3D;
	Tue,  6 Jun 2023 15:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90FB51E3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1686059511; bh=dDuiJtC24VzdW+Dfhr7wI+sSeuZ/1y/CLCgGZYk1WFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y37Wc0IGEPj2SS76VZrwz5gyRGe+FVQFJw47RA36sbU94kvhIAwWA0QmdJero4UrL
	 ZN15FvQkFg84cVKzgWO8IDnsMDFVtsSqoEFkED0lkGCCRxk1EzDBhguE3hsClVBkRW
	 SFGicwNFTfAryhHQBaZW7foa4GfKafG/T0RveYVw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  6 Jun 2023 15:51:39 +0200 (CEST)
Message-ID: <fd26e84e-10d0-c4d8-c3a5-0bfbb5e06b88@perex.cz>
Date: Tue, 6 Jun 2023 15:51:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 3/3] selftests: ALSA: Add test for the 'pcmtest' driver
Content-Language: en-US
To: Ivan Orlov <ivan.orlov0322@gmail.com>, tiwai@suse.com, corbet@lwn.net,
 broonie@kernel.org, skhan@linuxfoundation.org
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 gregkh@linuxfoundation.org, himadrispandya@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20230606133807.14089-1-ivan.orlov0322@gmail.com>
 <20230606133807.14089-3-ivan.orlov0322@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20230606133807.14089-3-ivan.orlov0322@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q32T34CAWBNQC67ESFL3I4LNGY24EEPQ
X-Message-ID-Hash: Q32T34CAWBNQC67ESFL3I4LNGY24EEPQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q32T34CAWBNQC67ESFL3I4LNGY24EEPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06. 06. 23 15:38, Ivan Orlov wrote:
> This test covers the new Virtual PCM Test Driver, including the capturing,
> playback and ioctl redefinition functionalities for both interleaved and
> non-interleaved access modes. This test is also helpful as an usage example
> of the 'pcmtest' driver.
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual PCM
> Test Driver.

Acked-by: Jaroslav Kysela <perex@perex.cz>

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

