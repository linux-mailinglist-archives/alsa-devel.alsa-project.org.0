Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D36D6164D1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 15:18:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A01611698;
	Wed,  2 Nov 2022 15:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A01611698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667398729;
	bh=Atb07j6KNgwKxdk8Jcl0CDLakqWwL1dt1gKnqL9QU90=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=PngK4/+pAvmQqStbsnitrAm8iHgooZW2X4i0+qnQk4Pe0gfZNzxw3JMlAU/wP5BSR
	 IY8gzONIOeBiqwNDJ+T0HA28hbVxqWvIUlTthp2y4vPKDgx1g4BQG6qw5Ma/zq70/W
	 JSQHuqrGHsX7NbxjqgxvNxTUSFvGtBzgi1BYDBXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74E35F804EB;
	Wed,  2 Nov 2022 15:17:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF932F8021D; Tue,  1 Nov 2022 02:08:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6496AF800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 02:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6496AF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G/qsep9+"
Received: by mail-pj1-x1032.google.com with SMTP id l6so11880279pjj.0
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87D1DIsm59BtOXDVm5u5ujWBF82YPU6s4OSpxniyum0=;
 b=G/qsep9+q0UsHdPwmKvoWL+WyU6qBdxyZWRWmb74T4QctSHM5yytQoWbLYdbJ6OlEY
 3b+cINMzKk8LhC9PsuVTTt9B9LMJIvLrvZLmGfnWsXgQRbpf3GJClEoBsCNLZ7CWYG9j
 LaF6pWH+N7GJspZ0bXKZ1cO2nzqkrJM7CzCUzcmgdQuoXkkYkEJCFr1Qzg6a+fBVw3Aw
 pOTJd+aF5E3BAu5jCQ/dKkC75HIlPk4Z6dwLGZRIr2ZVVV8bbZ7k18OuHlmCpPHi8HR5
 PUUhAPzmd7k/hmzAMkrVzlAd8I1hIUhw4uV2ilT2Vf0VdKRUEDcH9UJzNlkg8BGCwU2V
 AB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=87D1DIsm59BtOXDVm5u5ujWBF82YPU6s4OSpxniyum0=;
 b=kkrkswZy0SqTNpJX5yoFw8GbwYu6zlJfZ6kcslyhzXaq3oLj+R2WA3lBMmn278Zo4r
 RjkinXl82jX8X9Kr3+lr6Qn4NEVkjU56yRrtOZ49SK3b6mljFtGFNBf2rzAmIO6JK1uc
 KsaLC+tZHQaOK3JZeWokcMUCgqMa+Z5QTh0iE8iAAuVwmQSR+Dz1Ibte3Xq0FV3TKk/Q
 t2G45HAVr5BK5HMijJyu4JS/s6czDdbf2PWfhPXXY7gotdr4XuRNeWOQHhBZefhxZaWU
 snxCvUMJba95WPZ7yG8PBiaWWjda8QMFXZmsbtq4Wp+tNnuw/F2WNL4uIDdYdcvnI/D4
 16iw==
X-Gm-Message-State: ACrzQf0QkDPunB0CKv/lM+brzsLxoHw2Mwk6tXe+O45UEnTDcbf/6Qzw
 FK7YAeD+LPykJHmPbdXO5ajPLMzoTHkt3a6ycVGwzVUS
X-Google-Smtp-Source: AMsMyM6wu2vQCcii1by4deAaz8B3hlPulq4MJNS2FCmjY9r3So9bncxQBabpEEj6bTm7J4ar9b3eOMWSdytK69IofBA=
X-Received: by 2002:a17:90b:4cc5:b0:212:fbb8:bd02 with SMTP id
 nd5-20020a17090b4cc500b00212fbb8bd02mr35785pjb.29.1667264915380; Mon, 31 Oct
 2022 18:08:35 -0700 (PDT)
MIME-Version: 1.0
From: David Jaffe <davidajaffe@gmail.com>
Date: Mon, 31 Oct 2022 18:08:24 -0700
Message-ID: <CAG74igUcg-=1pz+YBOxCHR0K_N+k6YUv6n+d71BCEqAdvVVYCg@mail.gmail.com>
Subject: Feedback with embedded USB audio gadget
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Wed, 02 Nov 2022 15:17:26 +0100
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

I see that the USB Gadget has an explicit feedback node.   It seems to
deliver a constant (00 00 30 00) for a sample rate of 48kHz.    I see that
the value is initialized to a combination of the sample rate and the
"pitch", which appears to be a control of the driver.  Is the pitch plumbed
up to the user-level through alsa somehow (if so how)?    If not, is there
some ALSA layer that servos the pitch to keep the host clock and the
embedded clock synchronized?
