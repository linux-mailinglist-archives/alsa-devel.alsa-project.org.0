Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03CC324F23
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 12:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85391686;
	Thu, 25 Feb 2021 12:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85391686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614252484;
	bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FcDSLnbf0Y352hU4A/8vmAIYkigJhN/fjdB3QfCt6Qg+rEZc5J4y53qzPbF7nfN36
	 8pJQfnP42NaFRaG1uSVtlIUrrDvz0s/76vBf2aIXJ1lUKA7kj1t+JGGuywiAN7AaL1
	 Ci1JtQLfE2hIHRotfd/ZM8/g33jqb5DNhxdQYZys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84879F802E2;
	Thu, 25 Feb 2021 12:25:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87395F8016A; Sun, 21 Feb 2021 12:30:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CD0F800F3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CD0F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l+EoKzBy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F39464EE6;
 Sun, 21 Feb 2021 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613907020;
 bh=Ii6mCKLdMk+Svk1KpodaVpXsreuwHJe163Dne4id3BY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l+EoKzByXeItptxBFGA1ZcfMthX/fi23wE0xVeVVhothSkRH1ie6DzMSjHqzqNCzF
 rzuxeaOMCsJj0bVr/q8CGMW+HVBJifJrwxNIxAgYIAQMG9gxiP+FKP7mIEne1e/nAw
 4CardLEJXEhZffJdxS6rlVvEj2aEqy+VOO9k9sQevdb2hoj1k6zw9iO7xmJWrybxiG
 M6rozT1DsfVpEwq2uPb7DjVBqjGPIyGyNwLHtFDdF5PiOZ8w/ahWA0WYHAkkN5JKov
 nD3VaCaV7V/h0KA5OraMgYZ3nWouwNZNHGlPb7HQtj40TqszX/xEAPKFBt74iJnJyU
 BiWcbR+6OwHig==
Date: Sun, 21 Feb 2021 12:30:16 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 6/7] HID: lenovo: Map mic-mute button to KEY_F20
 instead of KEY_MICMUTE
Message-ID: <20210221123016.5f308702@kernel.org>
In-Reply-To: <20210221112005.102116-7-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
 <20210221112005.102116-7-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Feb 2021 12:25:30 +0100
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 alsa-devel@alsa-project.org, Jiri Kosina <jikos@kernel.org>,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
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

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
