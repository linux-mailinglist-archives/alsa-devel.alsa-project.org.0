Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA317B3F0D
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:12:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978F91073;
	Sat, 30 Sep 2023 10:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978F91073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061524;
	bh=oD2ORmg+k6EckJfCOgzrmHFLsbNnwuTk4rBCe8SUhYA=;
	h=Date:Subject:To:Cc:References:From:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oaX5KkVkJWD67IzrD0hnBT7cEBvJvPmUOaFr7jT0wZrBHHullofvNIMBUOG8BpQ8+
	 HhZsLp1u3qk6GMLTAqh2V2YbJ2Up5I/TsLGLiE80LQKoAMjUmkdv0/vnmZuJZ/KnAN
	 dVKuL/vNdLa5SYG0ipgXiNSn9sxdQm2c6kbq9WbU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0511F80130; Sat, 30 Sep 2023 10:08:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 773DFF80567;
	Sat, 30 Sep 2023 10:08:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF280F8016A; Wed, 27 Sep 2023 21:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from abi149hd126.arn1.oracleemaildelivery.com
 (abi149hd126.arn1.oracleemaildelivery.com [129.149.84.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D3D4F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 21:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D3D4F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=augustwikerfors.se header.i=@augustwikerfors.se
 header.a=rsa-sha256 header.s=oci-arn1-20220924 header.b=D2S+3Qt5;
	dkim=pass (2048-bit key,
 unprotected) header.d=arn1.rp.oracleemaildelivery.com
 header.i=@arn1.rp.oracleemaildelivery.com header.a=rsa-sha256
 header.s=prod-arn-20211201 header.b=ANVwMx8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=zEC1Zp0mTXHbkZhMbfbhPRw1ReAe5+CIJ539h/vevNs=;
 b=D2S+3Qt5OlnXTR+Dx/2h+Xc7q7p7EvsuJZwBDVmjvOTKWMT70IYxKB+0w/XJwRih9fz7T0L8X9qh
   c9lBX6gCAjhqDT2bBNEYEOnV9Gl+Iy8N8T90VM7X7KnZ95fcLHKzyNZFl4DK/RAg9P9BUmvU7gIq
   xtnFc/OyOtQ6QtiWyxVrSHarOps0BaKcesQKZrU9ev8Y38QOVFjnJ0QaVdndDMgYwWum6QQ5Y4pt
   jtY/e+L7/Yyx/M5Pm/5LOLNMxM+nYWh5SmelAPIYIxvSAF97QYmg8qzUp0R3g85K6XDOGuLJAy4/
   Sr3Te0wWiIJ2DPwW4KRqeL7lF4VFdSEilj7/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=zEC1Zp0mTXHbkZhMbfbhPRw1ReAe5+CIJ539h/vevNs=;
 b=ANVwMx8OUZE8LijI1gYRQ0MmwMfvjHR2rUeSIUpnLiYupbym2BMTEX1l99EO9IIKj0xfcNOB8lVr
   FOKinuNWCP9+nkXZs30J9OOMwZ4gqG8ljP1wy2knhlL1QhSJILuwwu7Wa9JjDViCc0wOa+7J3EbC
   XcqjIk0Tn98ksW9/SdE9TIVbDm2K0RWlmWD4sqW8G9p4EOA+quM7DP6dORZBwRaLj8XZyytHDsw8
   E7oGV8yNv0ryVEHGEOZAtJ6SsFwf/x9w9em3gIqk3QSCDdFjoseX/AXuM2ErdtNL77LFZV4WKeDs
   OfK/ZnConUYIkGiajqM5c/ubewvRdzBHRlhTHg==
Received: by omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id
 <0S1N004K9RT5Q720@omta-ad1-fd3-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for alsa-devel@alsa-project.org; Wed, 27 Sep 2023 19:07:53 +0000 (GMT)
Message-id: <288a2a10-137d-49b5-8d44-feb18f5696d2@augustwikerfors.se>
Date: Wed, 27 Sep 2023 21:07:49 +0200
MIME-version: 1.0
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
Content-language: en-US
To: Sven Frotscher <sven.frotscher@gmail.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
 regressions@lists.linux.dev
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
 <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
 <2ZQN1S.P7M0RX306S1D3@gmail.com>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <2ZQN1S.P7M0RX306S1D3@gmail.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta: 
 AAEINYZ3dhLONaY9tyI3lZesZ89O1+5jgsVyp4dMSkyYuppG/dP70jN8lViyntJq
 I5DRJNIssIA14bGdujZveWSb5GPSDteTcc0kn3SOWfRi56LV8Mo/S+2vX6oN99V8
 m46S5kNuNeH6xnb1pQ7zAjdC07+tFqPc+FbAAENJppyQnYXnGoPdeMBS/BLupgq7
 vuqSBojEtKETXUvNDl575q7tFwlvPIQgUw8jtnT0DvoEhzgab5RwkJSvon9Qm+eV
 KTAKMmWSLwK9WhAcvhfB1haltWFxo2AT9uxZ4SL655SGGHYPezzHax9H9UN7rQF7
 scKfKSfivCPHgP4U6hwiEjPwTepDjBB6izL+gNJpH6s6g636G05fJVEKa9pG85UP
 kqQ1plSOtY4Xb4086/cN0vB3dCDgU/NsqPIbP/Pfgf8oQJQ+FMIQCB9AGHAkA9K/ +FTKzw==
X-MailFrom: 
 bounces+alsa-devel=alsa-project.org@arn1.rp.oracleemaildelivery.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R6IHL4U25OYEXCWURBPQWSHYRAWSVWJT
X-Message-ID-Hash: R6IHL4U25OYEXCWURBPQWSHYRAWSVWJT
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:08:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6IHL4U25OYEXCWURBPQWSHYRAWSVWJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-27 20:49, Sven Frotscher wrote:
> Hello,
> 
>  > > Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
>  > Since this fixes a regression caused by commit c008323fe361 which has
>  > been backported to stable, please add "Fixes:" and "Cc:" tags above the
>  > "Signed-off-by:" tag to ensure the fix also gets backported in a timely
>  > manner [1]:
>  >
>  > Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on 
> Lenovo 82SJ")
>  > Cc: stable@vger.kernel.org
> I will.
> 
>  > > +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  > > +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
>  > Your e-mail client seems to have mangled the leading whitespace here,
>  > which will prevent the patch from applying cleanly.
> My e-mail client isn't the problem here, but my Vim syntax highlighting
> for tabs... I should've noticed that when copy-pasting from test e-mail
> to patch e-mail via Vim.
> 
> Should I reply to this thread with a [PATCH v2] message or create a new
> thread?
AFAIK either way is fine, separate thread seems more common though.
