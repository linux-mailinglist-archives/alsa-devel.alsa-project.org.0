Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 352E8874F26
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 13:33:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B4DC846;
	Thu,  7 Mar 2024 13:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B4DC846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709814787;
	bh=CnKV7YkmwKVN45OVgq9HMp191oP0lkB4cDHb6peK+T4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HEtJsU2s0iA3xLVIThubZUEKdVgSppDtC+xqPSBMLELk+pi4ZWVhNwy3uTA9Bxb42
	 HjbNJsdnTSiDp+aRKfJMlFz9roAepZcrTWmMR/KQTCOrUpw6h0wQWgxVIhUD2kHH9j
	 jYIr+5TLk6FLMYcFwjqShNq/KXFHMIZnOiz0tll8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59CEF805A9; Thu,  7 Mar 2024 13:32:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E21F802E8;
	Thu,  7 Mar 2024 13:32:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3D86F8024E; Thu,  7 Mar 2024 13:32:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99E6CF80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 13:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99E6CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=lBx1+QuJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709814736;
	bh=CnKV7YkmwKVN45OVgq9HMp191oP0lkB4cDHb6peK+T4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lBx1+QuJTEVHApTpCCDU+EV1Aykxe0USdn1M5qeFxUu86nOmkjduBDq8dT3o7qXpm
	 oS8/qBbiILsQJC5KQx/qJRP/+1Rtwj+Mvna+PmMaQHKiOOUzj3K4BfsAnCXpYBeO5i
	 sIHi1sZKR2G1jRkcILr1PE7EJZw85kHZ0/HyQZD5Je+4MUjufb3f6fIkyubjPbz8re
	 /xYRYrDhHsNlHZi8hwJ5D8xkg2qXwM8ii3IePd37e1Jh7QAPge7a0+jwCSZNdI+ZOe
	 Y4f3knEgXbFr14hWz3pvmzLU64Pzxk2jZ5fbpD4Fd7BcqwRmHFTOSol/RnqeVlE3F0
	 mpc6I8Pch7Hkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr7wZ6z4Xz4wc8;
	Thu,  7 Mar 2024 23:32:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dawei Li <set_pte_at@outlook.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Cc: "npiggin@gmail.com" <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-ide@vger.kernel.org"
 <linux-ide@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] powerpc: macio: Make remove callback of macio driver
 void returned
In-Reply-To: 
 <TYTP286MB356472357994D5EA49E2F5E3CA212@TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM>
References: 
 <TYCP286MB232391520CB471E7C8D6EA84CAD19@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
 <3dc29701-239f-4a3b-b571-b9732975bd73@csgroup.eu>
 <TYTP286MB356472357994D5EA49E2F5E3CA212@TYTP286MB3564.JPNP286.PROD.OUTLOOK.COM>
Date: Thu, 07 Mar 2024 23:32:14 +1100
Message-ID: <87bk7qnrxt.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: IM3OD323R2T5LOVS6CUXNYH4VCDJQGF5
X-Message-ID-Hash: IM3OD323R2T5LOVS6CUXNYH4VCDJQGF5
X-MailFrom: mpe@ellerman.id.au
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IM3OD323R2T5LOVS6CUXNYH4VCDJQGF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dawei Li <set_pte_at@outlook.com> writes:
> Hi Christophe,
>
> On Tue, Feb 20, 2024 at 04:12:17PM +0000, Christophe Leroy wrote:
>> Hi Michael,
>>=20
>> ping ?
>>=20
>> Le 01/02/2023 =C3=A0 15:36, Dawei Li a =C3=A9crit=C2=A0:
>> > Commit fc7a6209d571 ("bus: Make remove callback return void") forces
>> > bus_type::remove be void-returned, it doesn't make much sense for any
>> > bus based driver implementing remove callbalk to return non-void to
>> > its caller.
>> >=20
>> > This change is for macio bus based drivers.
>> >=20
>> > Signed-off-by: Dawei Li <set_pte_at@outlook.com>
>>=20
>> This patch is Acked , any special reason for not applying it ?
>>=20
>> Note that it now conflicts with commit 1535d5962d79 ("wifi: remove=20
>> orphaned orinoco driver") but resolution is trivial, just drop the=20
>> changes to that file.
>
> Thanks for picking it up, hardly believe that it's been one year.
>
> Michael,
>
> I will respin V4 if it's needed.

No that's fine, I'll sort it out.

cheers
