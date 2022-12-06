Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F327644497
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:32:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0171898;
	Tue,  6 Dec 2022 14:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0171898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670333553;
	bh=1ZuyLGXDg45PbQFAysob2iBqtcaVFMyZYRjDn5THSHI=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QNIa8EbBaKuqyZkO6gZ5/9WyVQZRt5rkUCm396IKs3+iOkQj+nMpwXxFUcV8ayNpt
	 q7hmHHvMxhb5KbQ2GKTIwGwUXdunMgCngclPzAXL/claJhNdZcFLgRTbl5/cTQe/Ln
	 MpRrlHsTMQQU9fDt5U46TRnxCM3KJa9NQaYWFUVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93835F80290;
	Tue,  6 Dec 2022 14:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB3ECF80246; Tue,  6 Dec 2022 14:31:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF01F8014C
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 14:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF01F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="s8XVEpg1"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4NRLsj3Pwdz9sZt
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 14:31:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1670333481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QSMO8q5SmEao0JiGTLMTuTQaBY9Vo5kSbXSoTt5l9aI=;
 b=s8XVEpg1jCRpp4samA4t6tkuPSELX4cxT9R6J7RoER/e/Du0LN9X7ltfEzKmo7LBPtbgbl
 Mm1VJLH06q3FfLjRGs+DOG0zGfoCacYNdVW7gsYoRsPK5Dk5Td7NC+CyZz8vCfBx+IlXIY
 SU4UtrABxu+vB1Sw/CyMo3jM4hOpwT4FggvTxwHaHwAVzjXu0LnUWJrYUZ6biJmvyJ6wLE
 Wu3jALitXJ2NBHvezfZR1ZP2vYMOOynh+Rwgkrs4eVc+nkwe/kkhqomVEPXwCcO62heIvE
 2+Q0KL5fOcWX0fYD3KZ2gFxmrLKR/B4TWH++lgGAv7Ti8ql57WFbXs8n0zP/aw==
Message-ID: <0f60f60e-581b-bc5a-514e-0bfc56b4377c@mailbox.org>
Date: Tue, 6 Dec 2022 14:31:16 +0100
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
Content-Language: en-US
From: Carlos Rafael Giani <crg7475@mailbox.org>
Subject: Adding AC3, TrueHD, and other audio codecs to compress-offload API
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: az17e1qjs99i4enmyhwus4pxxjg3pewg
X-MBO-RS-ID: 06f953e5cd41e4eaad4
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

Hello,

currently, the compress-offload API does not include AC3, EAC3, TrueHD, 
MPEG-H, DTS in its list of audio codecs (found in 
include/uapi/sound/compress_params.h ). However, in part due to the rise 
of 3D audio like Dolby Atmos, adding these codecs would be useful if the 
underlying DSP is able to directly receive the compressed audio frames 
instead of having to rely on passing the compressed data through IEC958 
/ IEC61937.

 From what I see, no special parameters would be needed - these codecs 
are self contained (no extra codec headers and such required). In the 
MPEG-H case, I'd limit support to MHAS (MPEG-H 3D Audio Stream), since 
that seems to be the more popular method of transporting MPEG-H frames, 
and also does not require any special extra info. As a result, this 
would amount to just adding a couple of audio codec #defines to 
compress_params.h .

Thoughts?

Carlos

