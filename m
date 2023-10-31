Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D87DD0C0
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 16:42:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2DDEDEE;
	Tue, 31 Oct 2023 16:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2DDEDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698766926;
	bh=dtXY7IX4ZbjIbfOBR3Yg3dEXsXuL8jrAXMnTZLSnRYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rddhKq6mCxyZXLdJeaEhfdOiHweIdlVYwreY9oTadZSachTqmWJLdlBXxCKdCsAMS
	 E5jkQ4blgK2UHQpYeOIpaUhiyFSGFuMzQ48TqKJaf1FHKk5GbUfyZNTsAcJM2DOqhn
	 XW4PeiIhjpL4tEF3sKwya/SGKXuBgD1gufEUCR4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF1E6F8057F; Tue, 31 Oct 2023 16:40:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57502F80579;
	Tue, 31 Oct 2023 16:40:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2136BF8057A; Tue, 31 Oct 2023 16:40:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5333F80568
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 16:40:53 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AF6C611D9;
	Tue, 31 Oct 2023 16:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AF6C611D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1698766852; bh=9iBcrcLEW4xQ5N8GQA0KrISWJj0GQz6/qZMuPiAAVBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ejs9UiJVPHTX3gO4BTR+EcWxxmSblPHhHFEaMc+wuDpnpYMdZBvNYUcGY3rxV/1lM
	 DzNEcpg7vyjOpxrT+DAsB8W5sSwtBRFlqJ+C1qPjqsitjO2UDZI4n6RnpVMwPqxtAi
	 lzFx8GkDLYHIyRp4Ck8vK/J6bOjm5DsNC1sOMXCA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 31 Oct 2023 16:40:48 +0100 (CET)
Message-ID: <9562ebc8-d74e-e8dd-4233-cb43bb16b15c@perex.cz>
Date: Tue, 31 Oct 2023 16:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH alsa-ucm-conf 2/2] bytcr-wm5102: Add support for different
 microphone routes
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, alsa-devel@alsa-project.org
References: <20231021211614.115152-1-hdegoede@redhat.com>
 <20231021211614.115152-2-hdegoede@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20231021211614.115152-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UFQAHHVDWDS4UESWTMHT54LPYABBSEUS
X-Message-ID-Hash: UFQAHHVDWDS4UESWTMHT54LPYABBSEUS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFQAHHVDWDS4UESWTMHT54LPYABBSEUS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21. 10. 23 23:16, Hans de Goede wrote:
> Unlike all designs supported sofar the Lenovo Yoga Tab 3 YT3-X90 does not
> have its internal microphone (intmic) on IN3L with the headset microphone
> on IN1L. Instead this tablet has the intmic on IN1L and the hsmic on IN2L.
> 
> Add IN1-InternalMic.conf and IN2-HeadsetMic.conf config snippets
> under ucm2/codecs/wm5102/ for this and check the components string
> to determine which microphone routes should be used.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks. Applied.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

