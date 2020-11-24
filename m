Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377B62C33CA
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 23:22:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8A9A1749;
	Tue, 24 Nov 2020 23:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8A9A1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606256551;
	bh=Zv2iqi/lZFLtCiEbQyPJtG2tEUhBLriaZTvWYj1OZOs=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MaIipRnwmZD5gISOXLl6LOTxPsEV1Ku4iilHdwKnU5zwmxusWzCoI2YnTf0Sqzh1M
	 +GRB31KNloXYkExDOoNnSjuprxDwTHwGDIrObcolXyon7o/c/1RTkoLiv7a51jL7rw
	 Q6JC01DPc8UYlV//fMohYUZDP2msnBRJmzbW4MGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F53CF80161;
	Tue, 24 Nov 2020 23:20:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A334EF80165; Tue, 24 Nov 2020 23:20:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00001F800C1
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 23:20:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00001F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="HuMTfxeR"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1606256447; bh=Zv2iqi/lZFLtCiEbQyPJtG2tEUhBLriaZTvWYj1OZOs=;
 h=X-EA-Auth:Message-ID:Subject:From:To:Date:Content-Type:
 MIME-Version:Content-Transfer-Encoding;
 b=HuMTfxeR3DtAV3bEG2fk4QVhxcVIKrGQs9EJuqWuD97r5n5vmw3RvbXqLDUtzvt2B
 GEqcYPMql1yn9YPRyaIFvTZt7YNhK4oUfVGXarksvWR+jaP2KlNipormrR2I8o4Dxr
 qPUi6oByZSPQtEkaDWrXvnOz9cVVqKlg2s6ETcvc=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Tue, 24 Nov 2020 23:20:47 +0100 (CET)
X-EA-Auth: lq+GW3UJ0XCFf9RTVO9KI3bEQmzJTpp9FgiYnLkYgSv8rKyaRinCxZXJmQ32+kg/BtKUr6sHWTDYjJ20Jz+r2M8lALw33BLvp7xiBdFks5A=
Message-ID: <f963978e5684ffd933d252d11d8cf7b14b2e00fb.camel@mailoo.org>
Subject: Dear akm.com, please publish/share AK4375[A] DAC datasheet
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Date: Tue, 24 Nov 2020 23:20:46 +0100
Content-Type: text/plain
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Thanks in advance



