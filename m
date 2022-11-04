Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7C61A5BD
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 00:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35C015C3;
	Sat,  5 Nov 2022 00:30:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35C015C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667604700;
	bh=HFB9LJtkXksk13IltS2cRaTz5+plZycvCbUQtVNS3Wc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=IyZ1ESXIKKtcfuRcZMr1/fuLMHvyCdjfVSQLuiDcJLwNx59xwNDNGDOoKV6Y6regV
	 qGlx25ACHt2FEGU+lNDm1zNpg7j75xFclchlwrVOmt8xK8FM+YZUMrcloWH341LXqN
	 qqt+EVTFOdl7NKazHC4gb5VJJV0sXAGq4AO7wpWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4E4F8047D;
	Sat,  5 Nov 2022 00:30:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5403F80448; Sat,  5 Nov 2022 00:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A34A8F80155
 for <alsa-devel@alsa-project.org>; Sat,  5 Nov 2022 00:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A34A8F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AZpJwk1U"
Received: by mail-pj1-x1030.google.com with SMTP id gw22so5811417pjb.3
 for <alsa-devel@alsa-project.org>; Fri, 04 Nov 2022 16:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jFvGKdueC5qMN1j4DMn0ZkvGNMocqoC0OJyDXqo7qgo=;
 b=AZpJwk1U8mpequR1xk/0F1I1Wqz1aYmicAPQrh7rDabdZCiOLF4WXSM1pS3CirGyIg
 TZ/gYLI7PxPGPQBO0qWknE1uDJrKveWH/F8WO73n4TQM2oQm6q3sOWXxzA4rdbgzjNm4
 vSNfNckwuPj2M1BrVzSvj/sVzOMI/c/isRIDXTvZVV/UGWK7+noElXaRubHwN5UvPw8N
 Eid/CUW/dNchWQegyU8ykGCWUW63sE8hq7sIZyGvZZH6XnUQ9nXFWdC7Zw/dKgw6MuEa
 0GVt2E0PnSYmEk2avD00ulQuePOfbe5/IkzZdFYyIdRwkqQFiTtaDM+N32a///VNINLu
 DVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jFvGKdueC5qMN1j4DMn0ZkvGNMocqoC0OJyDXqo7qgo=;
 b=DCMbu2YIuZwxb3jh1+Tty3IqY9TYbvUa3kit9ZrBfWanYjQsXuo1qKeFufKKNRsQMH
 NsovR4RfG6vtfR1u9MHJAmRgGRyDsP8c8e7HCovMgWpBWiKdxaxJE1+ZaI+P7vNK6wXI
 QdyHp6rNIYnreUkEzAQmg8D5Mcb445BAQgrMtkYd6UnwVl7D1EzqO0NQbM6hp5lYuW0j
 Kr2xzgKTDcpBL/ILCpHegCoSsPtAfBRuxTX1pdBZQI4F8AiM6O3NpbtDe94f7tGL0PkW
 ElC3HweH40u2aSgVl5xWKgfVbxvGcxnd56SDsl+KNFsxZQ9gIaofbTr3v/qnAQyvph8Z
 EUcg==
X-Gm-Message-State: ACrzQf2t9VTC/DAmrAINAffkwBK0SjkzhOt4XH2TeCwkVFML89uSarrh
 irsuFx/7y8bZnB2iyeMfHyNXrJnftlXiCop4PgqUoCW7
X-Google-Smtp-Source: AMsMyM7aGYW1IDB6Dl2f/sUx94dd2js1XQp+E/ssUDQFmn+XY98pW/wWhxiAqFbGcvYwUMUhBQYesgcGvB2TZ04eNZk=
X-Received: by 2002:a17:90b:30d8:b0:213:fd7d:6a7b with SMTP id
 hi24-20020a17090b30d800b00213fd7d6a7bmr25162081pjb.29.1667604637703; Fri, 04
 Nov 2022 16:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAG74igUcg-=1pz+YBOxCHR0K_N+k6YUv6n+d71BCEqAdvVVYCg@mail.gmail.com>
In-Reply-To: <CAG74igUcg-=1pz+YBOxCHR0K_N+k6YUv6n+d71BCEqAdvVVYCg@mail.gmail.com>
From: David Jaffe <davidajaffe@gmail.com>
Date: Fri, 4 Nov 2022 16:30:26 -0700
Message-ID: <CAG74igX+QXbH-h58-12rvOSd-s8jnsy0hgWBb8LB9rVZZy=rDw@mail.gmail.com>
Subject: Re: Feedback with embedded USB audio gadget
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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
Reply-To: davidajaffe@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Note that I answered this question myself.  Please ignore.

On Mon, Oct 31, 2022 at 6:08 PM David Jaffe <davidajaffe@gmail.com> wrote:

> I see that the USB Gadget has an explicit feedback node.   It seems to
> deliver a constant (00 00 30 00) for a sample rate of 48kHz.    I see that
> the value is initialized to a combination of the sample rate and the
> "pitch", which appears to be a control of the driver.  Is the pitch plumbed
> up to the user-level through alsa somehow (if so how)?    If not, is there
> some ALSA layer that servos the pitch to keep the host clock and the
> embedded clock synchronized?
>
>
>
>
>
