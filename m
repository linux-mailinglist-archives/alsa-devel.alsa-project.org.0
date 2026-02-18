Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDxnFGpdqGmZtgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:22 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B112043D6
	for <lists+alsa-devel@lfdr.de>; Wed, 04 Mar 2026 17:27:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A254602CE;
	Wed,  4 Mar 2026 17:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A254602CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772641641;
	bh=PM/Uu2f8zmPIzVw+igFkjhrmaVqko/YFD5SiD0naaSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QZQaf8ifHVRvxTVE8QVjFAb9hA2TrvCtrpCJB5eay8krfOySBYwN/RSX22y8FRmh+
	 ULT2xrEQzwnXwGEZKPDUuoieN9tsxXpgpXtljVHzy5KpJFd3Vfmqg+HbxIO/b+lobB
	 Kd+lbGMQlI1Z639gIA306b7cRPx98onNS9tfaoFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76F5FF806F7; Wed,  4 Mar 2026 17:25:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61A1BF806E3;
	Wed,  4 Mar 2026 17:25:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2C65F804F2; Wed, 18 Feb 2026 16:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_SAFE_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A823F8045D
	for <alsa-devel@alsa-project.org>; Wed, 18 Feb 2026 16:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A823F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l3m28IWg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FA9F600AE;
	Wed, 18 Feb 2026 15:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485D6C116D0;
	Wed, 18 Feb 2026 15:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771427894;
	bh=PM/Uu2f8zmPIzVw+igFkjhrmaVqko/YFD5SiD0naaSc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l3m28IWg9BQhM1eZew6wCEio4p6zbSeJZWzfJ1jG8GgrQ1X3BATgeSDjff/PoBuu0
	 tb6zOQKbVt5a7VsClVYHIkjRKjwXpHbt+eo9GDt1Gegn1S9gF01aCh2Bt6cRkG8Qrw
	 72EWjNoqQOq8MYx1MvZOL+Ff6Qn6A/cGUpaXGqRZeVbdiGSp2fnipnntgcsYeetQHf
	 bc+TIfwypYOwO+NC4rknzQgeyq4AE7/k2XN/0963N4SfQU18TfCp1WKfxPWKiW8Z71
	 SIx4DXuMyzWuVdnT3ZwRuJZ9L/PFUozDXC1iDnrmiOAL7yFFbPMI0jQBe3HZu7ZcQd
	 LnBFgMsppUaBg==
Message-ID: <b9dc73ea-0157-4f4c-9c62-8a3deb5b9bcd@kernel.org>
Date: Wed, 18 Feb 2026 09:18:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: amd: add ACPI mach entries and quirk
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260218104734.3641481-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CWUPVZRAC2GUFWIDPRXPAHH6RJGXXU2G
X-Message-ID-Hash: CWUPVZRAC2GUFWIDPRXPAHH6RJGXXU2G
X-Mailman-Approved-At: Wed, 04 Mar 2026 16:24:49 +0000
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWUPVZRAC2GUFWIDPRXPAHH6RJGXXU2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: F0B112043D6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	DATE_IN_PAST(1.00)[337];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alsa-project.org,gmail.com,perex.cz,suse.com,amd.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:rdns,alsa0.perex.cz:helo,alsa-project.org:dkim];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[superm1@kernel.org,alsa-devel-bounces@alsa-project.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Vijendar.Mukunda@amd.com,m:broonie@kernel.org,m:alsa-devel@alsa-project.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:Sunil-kumar.Dommati@amd.com,m:venkataprasad.potturu@amd.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/18/26 4:45 AM, Vijendar Mukunda wrote:
> Add ACPI mach entries for ACP7.0 platform for RT1320 + RT722 combination
> and include machine driver quirk for Lenovo laptops.
> 
> Vijendar Mukunda (2):
>    ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
>    ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models
> 
>   sound/soc/amd/acp/acp-sdw-legacy-mach.c  | 16 ++++++++++
>   sound/soc/amd/acp/amd-acp70-acpi-match.c | 37 ++++++++++++++++++++++++
>   2 files changed, 53 insertions(+)
> 
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
