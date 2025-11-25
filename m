Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F87C83094
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Nov 2025 02:39:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8887601F8;
	Tue, 25 Nov 2025 02:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8887601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764034781;
	bh=MzpTGZrLcy8StQ6HlCP1dE9QZFScfhd4LhgTXvzaibA=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kKd+PF2rCovs0VMCpxgbUHY/zg3d3cc3X9jIqijJcNFRmUDh78AzRpB+VCa7fS5av
	 0meHFXzi7yPGYxHBbr64erlhOk4ecrYZiNdx/K2f3t4ejzp5ke3S3gIuI+PpgLmnhd
	 FyaabM8RbOZ6q10tfVf/lM3ScKgefTWekZuwIBlg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0F1F805CA; Tue, 25 Nov 2025 02:39:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F70F805C4;
	Tue, 25 Nov 2025 02:39:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF1BF8003C; Tue, 25 Nov 2025 02:38:58 +0100 (CET)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 312C2F800FE
	for <alsa-devel@alsa-project.org>; Tue, 25 Nov 2025 02:38:58 +0100 (CET)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: aseqsend silently fails (ENODEV) with hardware port
From: gratianaolive@comfythings.com
To: alsa-devel@alsa-project.org
Date: Tue, 25 Nov 2025 01:38:58 -0000
Message-ID: <176403473818.20.912564362653607886@mailman-web.alsa-project.org>
In-Reply-To: <1844bddc59f45200-webhooks-bot@alsa-project.org>
References: <1844bddc59f45200-webhooks-bot@alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: ZOGEDG6KR56CL2QYK42NKBUHE2UCTDZV
X-Message-ID-Hash: ZOGEDG6KR56CL2QYK42NKBUHE2UCTDZV
X-MailFrom: gratianaolive@comfythings.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOGEDG6KR56CL2QYK42NKBUHE2UCTDZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Interesting issue! The ENODEV error suggests a device access problem. Perhaps a missing initialization step within aseqsend is the culprit, not handled correctly like in amidi. The diff showing subscription as a fix is telling. Anyone else see this when configuring ALSA after playing Snow Rider? https://snowridergame.io
